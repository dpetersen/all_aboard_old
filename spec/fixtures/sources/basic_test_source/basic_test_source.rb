class BasicTestSource < Source
  perspective("A Test Perspective")
end

SourceManager.instance.register_source(BasicTestSource)
