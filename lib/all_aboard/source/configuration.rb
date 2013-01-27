module AllAboard
  module Source::Configuration
    extend ActiveSupport::Concern

    module ClassMethods
      attr_accessor :configurable_attributes

      def configuration
        has_configuration? ? stored_configuration : blank_configuration
      end

    protected

      def configuration_scope
        AllAboard::Persistence::SourceConfigurationMetadata.where(source_name: self.name)
      end

      def has_configuration?
        configuration_scope.exists?
      end

      def stored_configuration
        configuration_scope.first.configuration
      end

      def blank_configuration
        self.configurable_attributes.each_with_object({}) do |attribute, h|
          h[attribute] = nil
        end
      end
    end
  end
end
