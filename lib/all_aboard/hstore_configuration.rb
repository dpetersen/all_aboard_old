module AllAboard
  module HstoreConfiguration
    extend ActiveSupport::Concern

    included do
      serialize :configuration, ActiveRecord::Coders::Hstore
    end

    def configuration
      HashWithIndifferentAccess.new(read_attribute(:configuration))
    end
  end
end
