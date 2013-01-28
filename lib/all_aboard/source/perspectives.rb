module AllAboard
  module Source::Perspectives
    attr_reader :perspectives

    def perspective(perspective_name)
      @perspectives ||= []
      @perspectives << perspective_name
    end

    def perspective_names
      perspectives
    end
  end
end
