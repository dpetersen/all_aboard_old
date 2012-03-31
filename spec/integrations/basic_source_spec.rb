require 'spec_helper'

class BasicSourceSpecTestSource < Source
  def render
    "Sample content from source"
  end
end

describe "Basic Source" do
  subject { page }
  before { SourceManager.instance.register_source(BasicSourceSpecTestSource) }

  context "visiting the homepage" do
    before { visit "/" }
    it { should have_content("Sample content from source") }
  end
end
