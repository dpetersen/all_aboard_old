class AllAboard::SourceManager
  attr_reader :source_base_paths

  def self.instance
    @instance ||= self.new
  end

  def initialize
    @source_base_paths = []
    register_source_base_path(File.join(AllAboard::Engine.root, "app", "sources"))
  end

  def register_source_base_path(path)
    @source_base_paths.insert(0, path)
  end

  def register_source(source_class)
    source_classes << source_class
  end

  def source_for_name(source_name)
    source_class = source_name.classify.constantize
    source_classes.find { |c| c == source_class }
  end

  def source_classes
    @source_classes ||= []
  end

  def source_names
    source_classes.map(&:name)
  end

  def queue_jobs_for_frequency(frequency)
    source_classes.each do |source_class|
      jobs_for_frequency = source_class.jobs_for_frequencies[frequency]
      next if jobs_for_frequency.nil?

      jobs_for_frequency.each(&:perform_async)
    end
  end
end
