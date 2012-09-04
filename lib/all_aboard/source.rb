module AllAboard
  class Source
    include Configuration
    extend Jobs
    extend ViewData
    extend Perspectives

    def self.filesystem_name
      self.name.underscore
    end
  end
end
