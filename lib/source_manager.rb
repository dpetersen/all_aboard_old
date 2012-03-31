class SourceManager
  def self.instance
    @instance ||= self.new
  end

  def register_source(source_class)
    source_classes << source_class
  end

  def source_for_name(source_name)
    source_class = "#{source_name}Source".classify.constantize
    source_classes.find { |c| c == source_class }
  end

  def source_classes
    @source_classes ||= []
  end
end
