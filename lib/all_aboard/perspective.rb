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
      source_relative_path = File.join(@source_class.filesystem_name, template_filename_for_pane(pane))
      source_bases_finder.find_file(source_relative_path)
    end

    def source_bases_finder
      MultipathFinder.new(SourceManager.instance.source_base_paths)
    end

    def template_filename_for_pane(pane)
      filesystem_name + "." + pane.filesystem_name + ".html.haml"
    end

    def filesystem_name
      name.gsub(" ", "").underscore
    end
  end
end
