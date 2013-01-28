class AllAboard::Pane
  include ActiveModel::Serialization

  attr_reader :position, :source, :perspective, :configuration

  def initialize(attributes = {})
    @position = attributes[:position]
    @source = attributes[:source]
    @perspective = attributes[:perspective]
    @configuration = attributes[:configuration]
  end
end
