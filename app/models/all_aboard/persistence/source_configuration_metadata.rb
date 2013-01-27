module AllAboard::Persistence
  class SourceConfigurationMetadata < ActiveRecord::Base
    include AllAboard::HstoreConfiguration

    attr_accessible :source_name, :configuration

    validates :source_name, :configuration, presence: true
  end
end
