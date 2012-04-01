class Perspective
  attr_accessor :name

  def initialize(source_class, name)
    @source_class = source_class
    self.name = name
  end

  def template
    Tilt.new(template_path)
  end

protected

  def template_path
    template_path = File.join(
      SourceManager.instance.source_base_path,
      @source_class.filesystem_name,
      template_filename
    )
  end

  def template_filename
    filesystem_name + ".html.haml"
  end

  def filesystem_name
    name.gsub(" ", "").underscore
  end
end
