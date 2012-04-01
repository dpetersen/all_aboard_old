class BasicTestSource < Source
  perspective("A Test Perspective") do
    "Markup from a test perspective"
  end
end

SourceManager.instance.register_source(BasicTestSource)
