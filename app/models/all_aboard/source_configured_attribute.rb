class AllAboard::SourceConfiguredAttribute < AllAboard::ConfiguredAttribute
  validates :source_name, presence: true
  attr_accessible :source_name
end
