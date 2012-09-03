class AllAboard::Slide
  include ActiveModel::Serialization
  include AllAboard::RoutableTo

  attr_reader :id, :layout_name, :position, :perspective_assignments

  def initialize(attributes = {})
    @id = attributes[:id]
    @layout_name = attributes[:layout_name]
    @position = attributes[:position]
    @perspective_assignments = attributes[:perspective_assignments] || []
  end

  def markup
    AllAboard::LayoutManager.instance.layout_for_name(layout_name).new.render
  end
end
