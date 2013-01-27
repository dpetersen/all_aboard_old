require 'spec_helper'

describe AllAboard::HstoreConfiguration do
  describe "#configuration" do
    subject(:configuration) do
      AllAboard::Persistence::SourceConfigurationMetadata.create!(
        source_name: "TestSource",
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
