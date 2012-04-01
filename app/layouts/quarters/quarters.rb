module Layouts
  class Quarters
    def self.name
      "Quarters"
    end

    def render
      "Quarters Layout"
    end
  end
end

LayoutManager.instance.register_layout(Layouts::Quarters)
