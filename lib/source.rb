class Source
  def self.filesystem_name
    self.name.underscore
  end

  def self.perspective(perspective_name)
    @perspectives ||= []
    @perspectives << perspective_name
  end

  def self.perspectives
    @perspectives
  end

  def self.perspective_names
    perspectives
  end

  def render(perspective_name)
    template_for_perspective(perspective_name).render.strip
  end

protected

  def template_for_perspective(perspective_name)
    Tilt.new(perspective_template_path(perspective_name))
  end

  def perspective_template_path(perspective_name)
    template_path = File.join(
      SourceManager.instance.source_base_path,
      self.class.filesystem_name,
      perspective_template_filename(perspective_name)
    )
  end

  def perspective_template_filename(perspective_name)
    perspective_filesystem_name(perspective_name) + ".html.haml"
  end

  def perspective_filesystem_name(perspective_name)
    perspective_name.gsub(" ", "").underscore
  end
end
