class Source
  def self.filesystem_name
    self.name.underscore
  end

  def self.perspective(perspective_name)
    @perspectives ||= []
    @perspectives << Perspective.new(self, perspective_name)
  end

  def self.perspectives
    @perspectives
  end

  def self.perspective_names
    perspectives.map(&:name)
  end

  def render(perspective_name, pane)
    perspective = perspective_for_name(perspective_name)
    perspective.template_for_pane(pane).render.strip
  end

protected

  def perspective_for_name(perspective_name)
    self.class.perspectives.detect { |p| p.name == perspective_name }
  end
end
