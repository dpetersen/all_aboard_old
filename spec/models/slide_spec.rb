require 'spec_helper'

describe AllAboard::Slide do
  it { should belong_to(:board) }
  it { should have_many(:perspective_assignments) }

  it { should validate_presence_of(:board) }
  it { should validate_presence_of(:position) }

  describe "#position" do
    let(:board) { FactoryGirl.create(:board) }
    subject { board.slides.build.position }

    context "on a Board's first slide" do
      it { should == 1}
    end

    context "on a Board's subsequent slides" do
      before { board.slides.create! }
      it { should == 2 }
    end
  end
end
