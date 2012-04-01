class LayoutManager
  def self.instance
    @instance ||= self.new
  end

  def register_layout(layout_class)
    layout_classes << layout_class
  end

  def layout_for_name(layout_name)
    layout_classes.find { |l| l.name == layout_name }
  end

  def layouts
    layout_classes
  end

  def layout_names
    layout_classes.map(&:name)
  end

protected

  def layout_classes
    @layout_classes ||= []
  end
end
