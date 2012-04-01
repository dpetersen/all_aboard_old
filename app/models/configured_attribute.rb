class ConfiguredAttribute < ActiveRecord::Base
  validates :source_name, :name, :value, presence: true
  attr_accessible :source_name, :name, :value
end
