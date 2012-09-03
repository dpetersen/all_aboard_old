class AllAboard::SlideSerializer < ActiveModel::Serializer
  attributes :id, :markup
  has_many :panes, serializer: AllAboard::PaneSerializer
end
