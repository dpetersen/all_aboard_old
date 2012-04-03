module AllAboard
  class Layout
    def render(slide)
      template = Tilt.new(path_to_template)
      context = LayoutRenderingContext.new(slide)
      template.render(context)
    end

  protected

    def path_to_template
      File.join(
        AllAboard::Engine.root,
        "app",
        "layouts",
        "all_aboard",
        layout_filesystem_name,
        "#{layout_filesystem_name}.html.haml"
      )
    end

    def layout_filesystem_name
      self.class.name.underscore
    end
  end
end
