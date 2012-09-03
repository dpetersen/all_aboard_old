class AllAboard::Pane
  include ActiveModel::Serialization

  attr_reader :position, :source

  def initialize(attributes = {})
    @position = attributes[:position]
    @source = attributes[:source]
  end
end
