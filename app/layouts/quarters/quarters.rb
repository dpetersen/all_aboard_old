class Quarters < Layout
  def self.name
    "Quarters"
  end
end

LayoutManager.instance.register_layout(Quarters)
