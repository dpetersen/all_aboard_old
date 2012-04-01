class Pane
  def self.filesystem_name
    self.name.underscore
  end

  def width
    raise "Panes should specify their own width!"
  end

  def height
    raise "Panes should specify their own height!"
  end
end
