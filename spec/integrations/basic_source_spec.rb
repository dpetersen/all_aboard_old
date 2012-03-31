require 'spec_helper'

class BasicSourceSpecTestSource
  def render
    "Sample content from source"
  end
end

describe "Basic Source" do
  before { SourceManager.register_source(BasicSourceSpecTestSource) }
  after { SourceManager.flush_sources }

  it "shows a view from the source" do
    visit "/"
    page.should have_content("Sample content from source")
  end
end
