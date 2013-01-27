class AllAboard::SlideSerializer < ActiveModel::Serializer
  attributes :id, :layout_name
  has_many :panes, serializer: AllAboard::PaneSerializer
end
