class Source
  extend Source::Persistence

  cattr_accessor :configurable_attributes

  def self.has_job(job_class, frequency)
    @jobs_for_frequencies ||= {}
    @jobs_for_frequencies[frequency] ||= []
    @jobs_for_frequencies[frequency] << job_class
  end

  def self.jobs_for_frequencies
    @jobs_for_frequencies || {}
  end

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

  def configuration
    self.class.configurable_attributes.inject({}) do |h, attribute|
      h[attribute] = configured_attribute_for(attribute).try(:value)
      h
    end
  end

  def render(perspective_name, pane)
    perspective = perspective_for_name(perspective_name)
    context = PerspectiveRenderingContext.new(self)
    perspective.template_for_pane(pane).render(context).strip
  end

protected

  def configured_attributes
    ConfiguredAttribute.where(source_name: self.class.name)
  end

  def configured_attribute_for(attribute)
    configured_attributes.where(name: attribute).first
  end

  def perspective_for_name(perspective_name)
    self.class.perspectives.detect { |p| p.name == perspective_name }
  end
end
