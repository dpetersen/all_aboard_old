require 'spec_helper'

describe AllAboard::PaneSerializer do
  let(:source) { BasicTestSource }
  let(:pane) { AllAboard::Pane.new(position: 2, source: source, perspective: "A Test Perspective") }
  subject {  AllAboard::PaneSerializer.new(pane).as_json[:pane] }

  its([:position]) { should eq(2) }
  its([:perspective]) { should eq("A Test Perspective") }
end
