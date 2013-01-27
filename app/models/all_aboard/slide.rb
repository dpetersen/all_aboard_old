class AllAboard::Slide
  include ActiveModel::Serialization
  include AllAboard::RoutableTo
  include AllAboard::Persistence::SlidePersistence

  attr_reader :id, :layout_name, :position, :panes

  def initialize(attributes = {})
    @id = attributes[:id]
    @layout_name = attributes[:layout_name]
    @position = attributes[:position]
    @panes = attributes[:panes] || []
  end
end
