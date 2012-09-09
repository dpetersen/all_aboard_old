require 'spec_helper'

class UpdateTestClassOne
end

class UpdateTestClassTwo
end

describe AllAboard::Update do
  def persist(source_class, data)
    AllAboard::Update.persist(source_class, data)
  end

  describe ".persist" do
    let(:uuid) { "Test UUID" }
    let(:update_count) { AllAboard.redis.zcount("updates", "-inf", "+inf") }
    let(:first_update) { JSON.parse(AllAboard.redis.zrevrange("updates", 0, 0).first) }

    describe "existing data that has expired" do
      before do
        Timecop.freeze((AllAboard::Update::EXPIRATION_PERIOD + 1.minute).ago) do
          persist(UpdateTestClassOne, "First Data")
        end

        persist(UpdateTestClassTwo, "Second Data")
      end

      it "removes expired updates" do
        expect(update_count).to eq(1)
        expect(first_update["data_object"]).to eq("Second Data")
      end
    end

    describe "the persisted data" do
      before { persist(UpdateTestClassOne, "Test Data") }

      describe "the number of items in the update set" do
        subject { update_count }
        it { should eq(1) }
      end

      describe "the stored update" do
        subject { first_update }

        its(["id"]) { should eq("UpdateTestClassOne") }
        its(["data_object"]) { should eq("Test Data") }
      end
    end
  end

  describe ".since" do
    subject(:updates) { AllAboard::Update.since(latest_timestamp) }

    context "with no updates" do
      let(:latest_timestamp) { Time.now }
      it { should be_empty }
    end

    context "with an update after the requested one" do
      let(:latest_timestamp) { 1.minute.ago }
      before do
        Timecop.freeze(latest_timestamp) do
          persist(UpdateTestClassOne, "Old Data")
        end
        persist(UpdateTestClassTwo, "New Data")
      end

      it "returns only the expected update" do
        expect(updates.length).to eq(1)
        expect(JSON.parse(updates.first)["data_object"]).to eq("New Data")
      end
    end

    context "when the same source is updated across two new updates" do
      let(:latest_timestamp) { 2.minute.ago }
      before do
        Timecop.freeze(1.minute.ago) do
          persist(UpdateTestClassOne, "Original Data")
        end
        persist(UpdateTestClassOne, "Updated Data")
      end

      it "returns only the most recent update for that source" do
        expect(updates.length).to eq(1)
        expect(JSON.parse(updates.first)["data_object"]).to eq("Updated Data")
      end
    end

    # Technically speaking, your particular board might not care at about *all* of the data in your system.  If there's a source that isn't assigned anywhere on this board, we shouldn't send along updates for it.
    it "limits the sources to those we care about when a board (or maybe a list?) is passed in"
  end
end
