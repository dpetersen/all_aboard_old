module AllAboard
  class Source
    extend Persistence
    extend Jobs
    extend Perspectives
    include Configuration

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
