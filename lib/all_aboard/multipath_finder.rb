class AllAboard::MultipathFinder
  def initialize(paths)
    @paths = paths
  end

  def find_file(filename)
    @paths.each do |path|
      full_path = File.join(path, filename)
      return full_path if File.exists?(full_path)
    end

    raise "I couldn't find the file '#{filename}' in any of the known paths: #{@paths.inspect}"
  end
end
