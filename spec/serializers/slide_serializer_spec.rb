require 'spec_helper'

describe AllAboard::SlideSerializer do
  let(:slide) { AllAboard::Slide.new(layout_name: "Quarters") }
  let(:hash) { AllAboard::SlideSerializer.new(slide).as_json[:slide] }
  subject { hash }

  describe "markup" do
    subject { hash[:markup] }
    it { should be_present }
  end
end
