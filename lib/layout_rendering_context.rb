class LayoutRenderingContext
  def initialize(slide)
    @slide = slide
    match_perspectives_to_panes
  end

  def content_for_pane(pane_number, pane)
    perspective_assignment = perspective_assignment_for_pane_number(pane_number)
    return unless perspective_assignment

    source = SourceManager.instance.source_for_name(perspective_assignment.source_name)
    source.new.render(perspective_assignment.perspective_name, pane)
  end

protected

  def perspective_assignment_for_pane_number(pane_number)
    @pane_assigments[pane_number]
  end

  def match_perspectives_to_panes
    @pane_assigments = {}
    @slide.perspective_assignments.each do |perspective_assignment|
      @pane_assigments[perspective_assignment.position] = perspective_assignment
    end
  end
end
