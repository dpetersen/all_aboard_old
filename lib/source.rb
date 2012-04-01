class Source
  def self.name
    self.to_s
  end

  def self.perspective(perspective_name, &response)
    @perspectives ||= {}
    @perspectives[perspective_name] = response
  end

  def self.perspectives
    @perspectives
  end

  def self.perspective_names
    perspectives.keys
  end

  def render(perspective_name)
    self.class.perspectives[perspective_name].()
  end
end
