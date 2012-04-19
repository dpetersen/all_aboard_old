fixture_source_base_path = File.join(AllAboard::Engine.root, "spec", "fixtures", "sources")

AllAboard::SourceManager.instance.register_source_base_path(fixture_source_base_path)
require File.join(fixture_source_base_path, "basic_test_source", "basic_test_source")
