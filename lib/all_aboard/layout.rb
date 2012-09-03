module AllAboard
  class Layout
    def render
      template = Tilt.new(path_to_template)
      context = LayoutRenderingContext.new(self)
      template.render(context)
    end

    def id
      self.class.name.underscore
    end

  protected

    def path_to_template
      File.join(
        AllAboard::Engine.root,
        "app",
        "layouts",
        "all_aboard",
        id,
        "#{id}.html.haml"
      )
    end
  end
end
