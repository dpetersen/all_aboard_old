class BasicTestSource < Source
  self.configurable_attributes = [ :a_source_value, :a_second_source_value ]

  perspective("A Test Perspective")
  perspective("A Perspective With Configuration Data")
end

SourceManager.instance.register_source(BasicTestSource)
