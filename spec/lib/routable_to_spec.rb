require 'spec_helper'

describe AllAboard::RoutableTo do
  let(:klass) do
    Class.new do
      include AllAboard::RoutableTo
      attr_accessor :id
    end
  end
  let(:instance) { klass.new }

  describe "#persisted?" do
    subject { instance.persisted? }

    context "when id is nil" do
      it { should be_false }
    end

    context "when id is set" do
      before { instance.id = 19 }
      it { should be_true }
    end
  end
end
