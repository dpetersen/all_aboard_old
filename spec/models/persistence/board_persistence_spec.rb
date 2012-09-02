require 'spec_helper'

describe AllAboard::Persistence::BoardPersistence do
  describe ".all" do
    let(:boards) { AllAboard::Board.all }
    subject { boards }

    context "with an empty database" do
      it { should be_empty }
    end

    context "with an item in the database" do
      before { AllAboard::Persistence::BoardMetadata.create!(name: "Test Name") }

      its(:length) { should eq(1) }

      describe "the instantiated object" do
        subject { boards.first }

        it { should be_a(AllAboard::Board) }
        its(:name) { should eq("Test Name") }
      end
    end
  end

  describe ".find" do
    context "when the record doesn't exist" do
      it "raises a NoSuchRecord exception" do
        expect { AllAboard::Board.find(nil) }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end

    context "when the record exists" do
      let!(:board_metadata) do
        AllAboard::Persistence::BoardMetadata.create!(name: "Test Name")
      end
      let(:board) { AllAboard::Board.find(board_metadata.id) }
      subject { board }

      it { should be_a(AllAboard::Board) }
      its(:id) { should eq(board_metadata.id) }
      its(:name) { should eq("Test Name") }

      context "when child slides exist" do
        let!(:slide_metadata) { board_metadata.slides.create!(layout_name: "Test Layout") }
        let(:slides) { board.slides }
        subject { slides }

        its(:length) { should eq(1) }

        describe "the instantiated slide" do
          let(:slide) { slides.first }
          subject { slide }
          it { should be_a(AllAboard::Slide) }
          its(:id) { should eq(slide_metadata.id) }
          its(:layout_name) { should eq("Test Layout") }

          context "when child perspective assignments exist" do
            let!(:perspective_assignment_metadata) do
              slide_metadata.perspective_assignments.create!(
                source_name: "Source Name",
                perspective_name: "Perspective Name",
                position: 2
              )
            end
            let(:perspective_assignments) { slide.perspective_assignments }
            subject { perspective_assignments }

            its(:length) { should eq(1) }

            describe "the instantiated perspective assignment" do
              subject { perspective_assignments.first }
              its(:source_name) { should eq("Source Name") }
              its(:perspective_name) { should eq("Perspective Name") }
              its(:position) { should eq(2) }
            end
          end
        end
      end
    end
  end
end
