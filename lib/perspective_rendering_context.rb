class PerspectiveRenderingContext
  # Why not just #source?  That's some kind of reserved word in the
  # context of a view, apparently.  Boy was that fun to debug.
  attr_reader :parent_source

  def initialize(source)
    @parent_source = source
  end
end
