module AllAboard
  module Source::Perspectives
    attr_reader :perspectives

    def perspective(perspective_name)
      @perspectives ||= []
      @perspectives << Perspective.new(self, perspective_name)
    end

    def perspective_names
      perspectives.map(&:name)
    end

    def perspective_for_name(perspective_name)
      perspectives.detect { |p| p.name == perspective_name }
    end
  end
end
