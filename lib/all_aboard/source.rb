module AllAboard
  class Source
    include Configuration
    extend Jobs
    extend ViewData
    extend Perspectives

    def self.filesystem_name
      self.name.underscore
    end

    def render(perspective_name, pane)
      perspective = self.class.perspective_for_name(perspective_name)
      context = PerspectiveRenderingContext.new(self)
      perspective.template_for_pane(pane).render(context).strip
    end
  end
end
