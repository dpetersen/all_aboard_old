require 'spec_helper'

describe AllAboard::Board do
  it { should be_a(AllAboard::Persistence::BoardPersistence) }

  describe ".new" do
    context "with no arguments" do
      subject { AllAboard::Board.new }
      its(:id) { should be_nil }
      its(:name) { should be_nil }
      its(:slides) { should be_empty }
    end

    context "passed attributes" do
      subject { AllAboard::Board.new(id: 19, name: "Test Name", slides: [ "slide" ]) }
      its(:id) { should eq(19) }
      its(:name) { should eq("Test Name") }
      its(:slides) { should eq([ "slide" ]) }
    end
  end
end
