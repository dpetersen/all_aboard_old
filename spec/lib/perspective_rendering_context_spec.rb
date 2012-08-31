require 'spec_helper'

describe AllAboard::PerspectiveRenderingContext do
  describe "instantiated with a source" do
    let(:source) { double("source") }
    subject { AllAboard::PerspectiveRenderingContext.new(source) }

    its(:parent_source) { should eq(source) }
  end
end
