require 'spec_helper'

describe PerspectiveRenderingContext do
  describe "instantiated with a source" do
    let(:source) { double("source") }
    subject { PerspectiveRenderingContext.new(source) }

    its(:parent_source) { should == source }
  end
end
