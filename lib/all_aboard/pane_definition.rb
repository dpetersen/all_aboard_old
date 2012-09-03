class AllAboard::PaneDefinition
  def self.filesystem_name
    self.name.underscore.split("/").last
  end

  def width
    raise "PaneDefinitions should specify their own width!"
  end

  def height
    raise "PaneDefinitions should specify their own height!"
  end
end
