class AllAboard::Pane
  include ActiveModel::Serialization

  attr_reader :position, :source, :perspective, :configuration

  def initialize(attributes = {})
    @position = attributes[:position]
    @source = attributes[:source]
    @perspective = attributes[:perspective]
    @configuration = attributes[:configuration]
  end

  def template_markup
    return "Couldn't find the assigned perspective" if perspective.nil?

    # TODO: gotta actually set this.  I guess your position and slide will determine.
    pane_definition = AllAboard::QuarterPane
    perspective.template_for_pane_definition(pane_definition).render.strip
  end
end
