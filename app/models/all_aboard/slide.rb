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

  def markup
    layout = AllAboard::LayoutManager.instance.layout_for_name(layout_name)

    # TODO: Seems like this logic should be in the LayoutManager.
    if layout.present? then layout.new.render
    else"Unknown Layout Name '#{layout_name}'"
    end
  end
end
