class AllAboard::BoardSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :slides, serializer: AllAboard::SlideSerializer
end
