class AllAboard::Board
  include Persistence::BoardPersistence
  include RoutableTo

  attr_reader :id, :name, :slides

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @slides = attributes[:slides] || []
  end
end
