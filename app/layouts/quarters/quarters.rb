module Layouts
  class Quarters
    def self.name
      "Quarters"
    end

    def render(slide)
      buffer = "Quarters Layout"
      slide.perspective_assignments.each do |perspective_assignment|
        source_name = perspective_assignment.source_name
        source = SourceManager.instance.source_for_name(source_name).new

        buffer << source.render(perspective_assignment.perspective_name)
      end

      buffer
    end
  end
end

LayoutManager.instance.register_layout(Layouts::Quarters)
