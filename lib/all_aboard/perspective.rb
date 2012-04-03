module AllAboard
  class Perspective
    attr_accessor :name

    def initialize(source_class, name)
      @source_class = source_class
      self.name = name
    end

    def template_for_pane(pane)
      Tilt.new(template_path_for_pane(pane))
    end

  protected

    def template_path_for_pane(pane)
      template_path = File.join(
        SourceManager.instance.source_base_path,
        @source_class.filesystem_name,
        template_filename_for_pane(pane)
      )
    end

    def template_filename_for_pane(pane)
      filesystem_name + "." + pane.filesystem_name + ".html.haml"
    end

    def filesystem_name
      name.gsub(" ", "").underscore
    end
  end
end
