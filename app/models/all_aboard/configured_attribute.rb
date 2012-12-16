class AllAboard::ConfiguredAttribute < ActiveRecord::Base
  validates :name, :value, presence: true
  attr_accessible :name, :value
end
