require 'spec_helper'

describe AllAboard::LayoutRenderingContext do
  describe "#content_for_pane" do
    let(:layout) { double }
    let(:layout_rendering_context) { AllAboard::LayoutRenderingContext.new(layout) }
    subject do
      Capybara.string(layout_rendering_context.content_for_pane(1, AllAboard::QuarterPane))
    end

    it { should have_selector(".pane-1") }
  end
end
