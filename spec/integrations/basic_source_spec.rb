require 'spec_helper'

class BasicSourceSpecTestSource
  def render
    "Sample content from source"
  end
end

describe "Basic Source" do
  subject { page }
  before { SourceManager.register_source(BasicSourceSpecTestSource) }
  after { SourceManager.flush_sources }

  context "visiting the homepage" do
    before { visit "/" }
    it { should have_content("Sample content from source") }
  end
end
