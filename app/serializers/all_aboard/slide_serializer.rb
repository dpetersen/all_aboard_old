class AllAboard::SlideSerializer < ActiveModel::Serializer
  attributes :id, :layout_id
  has_many :panes, serializer: AllAboard::PaneSerializer

  def layout_id
    object.layout_name
  end
end
