module Layouts
  class Quarters
    def self.name
      "Quarters"
    end
  end
end

LayoutManager.instance.register_layout(Layouts::Quarters)
