class AllAboard::SlideSerializer < ActiveModel::Serializer
  # attributes :id, :markup, :layout_name
  attributes :id, :layout_name
  has_many :panes, serializer: AllAboard::PaneSerializer
end
