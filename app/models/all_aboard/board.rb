class AllAboard::Board < ActiveRecord::Base
  has_many :slides

  validates :name, presence: true

  attr_accessible :name
end
