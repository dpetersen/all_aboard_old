require 'spec_helper'

describe Slide do
  it { should belong_to(:board) }

  it { should validate_presence_of(:board) }
  it { should validate_presence_of(:position) }

  describe "#position" do
    let(:board) { FactoryGirl.create(:board) }

    context "on a Board's first slide" do

      it "sets a position automatically" do
        board.slides.build.position.should == 1
      end
    end

    context "on a Board's subsequent slides" do
      before { board.slides.create! }

      it "sets the proper position on a new Slide" do
        board.slides.build.position.should == 2
      end
    end
  end
end
