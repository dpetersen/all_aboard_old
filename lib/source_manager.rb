class SourceManager
  def self.register_source(source_class)
    source_classes << source_class
  end

  def self.source_for_name(source_name)
    source_class = "#{source_name}Source".classify.constantize
    source_classes.find { |c| c == source_class }
  end

  def self.flush_sources
    @source_classes = nil
  end

  def self.source_classes
    @source_classes ||= []
  end
end
