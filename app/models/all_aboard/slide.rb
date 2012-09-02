class AllAboard::Slide
  include AllAboard::RoutableTo

  attr_reader :id, :layout_name, :position, :perspective_assignments

  def initialize(attributes = {})
    @id = attributes[:id]
    @layout_name = attributes[:layout_name]
    @position = attributes[:position]
    @perspective_assignments = attributes[:perspective_assignments] || []
  end
end
