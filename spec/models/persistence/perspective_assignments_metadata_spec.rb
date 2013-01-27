require 'spec_helper'

describe AllAboard::Persistence::PerspectiveAssignmentsMetadata do
  it { should validate_presence_of(:slide_id) }
  it { should validate_presence_of(:source_name) }
  it { should validate_presence_of(:perspective_name) }
  it { should validate_presence_of(:position) }

  describe "#configuration" do
    subject(:configuration) do
      AllAboard::Persistence::PerspectiveAssignmentsMetadata.create!(
        slide_id: 1,
        source_name: "BasicTestSource",
        perspective_name: "A Test Perspective",
        position: 1,
        configuration: { "one" => "1" }
      ).reload.configuration
    end

    it "serializes and deserializes a hash properly" do
      expect(configuration).to eq("one" => "1")
    end

    it "allows indifferent access" do
      expect(configuration[:one]).to eq("1")
    end
  end
end
