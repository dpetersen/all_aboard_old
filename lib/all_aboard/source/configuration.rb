module AllAboard
  module Source::Configuration
    extend ActiveSupport::Concern

    module ClassMethods
      attr_accessor :configurable_attributes
    end

    def configuration
      self.class.configurable_attributes.inject({}) do |h, attribute|
        h[attribute] = configured_attribute_for(attribute).try(:value)
        h
      end
    end

  protected

    def configured_attributes
      ConfiguredAttribute.where(source_name: self.class.name)
    end

    def configured_attribute_for(attribute)
      configured_attributes.where(name: attribute).first
    end
  end
end
