class AllAboard::PerspectiveAssignment
  attr_reader :source_name, :perspective_name, :position

  def initialize(attributes = {})
    @source_name = attributes[:source_name]
    @perspective_name = attributes[:perspective_name]
    @position = attributes[:position]
  end
end
