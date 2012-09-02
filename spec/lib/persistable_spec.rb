require 'spec_helper'

describe AllAboard::Persistable do
  describe "#save" do
    context "for a new Board" do
      let(:save) { board.save }
      subject { save }

      context "when the attributes are valid" do
        let(:board) { AllAboard::Board.new(id: nil, name: "Test Name") }

        it { should be_true }

        context "after save" do
          let(:latest_record) { AllAboard::Persistence::BoardMetadata.first }
          before { save }

          it "persists a record" do
            expect(AllAboard::Persistence::BoardMetadata.count).to eq(1)
          end

          context "the persisted record" do
            subject { latest_record }
            its(:name) { should eq("Test Name") }
          end

          context "the model" do
            subject { board }
            its(:id) { should == latest_record.id }
          end
        end
      end

      context "when the attributes are not valid" do
        let(:board) { AllAboard::Board.new(id: nil, name: nil) }

        it { should be_false }

        it "does not persist a record" do
          expect(AllAboard::Persistence::BoardMetadata.count).to eq(0)
        end

        it "doesn't leaves the model's id nil" do
          expect(board.id).to be_nil
        end
      end
    end

    context "for an existing Board" do
      let(:board_metadata) do
        AllAboard::Persistence::BoardMetadata.create!(name: "Test Name")
      end
      let(:save) { board.save }
      subject { save }

      context "when the attributes are valid" do
        let(:board) { AllAboard::Board.new(id: board_metadata.id, name: "Updated Name") }

        it { should be_true }

        context "after save" do
          before { save }

          it "does not persist additional records" do
            expect(AllAboard::Persistence::BoardMetadata.count).to eq(1)
          end

          it "updates the record" do
            expect(board_metadata.reload.name).to eq("Updated Name")
          end
        end
      end

      context "when the attributes are not valid" do
        let(:board) { AllAboard::Board.new(id: board_metadata.id, name: nil) }

        it { should be_false }

        it "does not update the record" do
          expect(board_metadata.reload.name).to eq("Test Name")
        end
      end
    end
  end

  describe "#errors" do
    let(:board) { AllAboard::Board.new(name: nil) }
    subject { board.errors }

    it { should be_a(ActiveModel::Errors) }

    context "before save" do
      it { should be_empty }
    end

    context "after save" do
      before { board.save }
      it { should_not be_empty }
    end
  end
end
