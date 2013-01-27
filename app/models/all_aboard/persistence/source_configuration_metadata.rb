module AllAboard::Persistence
  class SourceConfigurationMetadata < ActiveRecord::Base
    attr_accessible :configuration, :source_name

    serialize :configuration, ActiveRecord::Coders::Hstore

    validates :source_name, :configuration, presence: true

    def configuration
      HashWithIndifferentAccess.new(read_attribute(:configuration))
    end
  end
end
