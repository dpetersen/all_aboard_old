require 'spec_helper'

describe AllAboard::Persistence::BoardMetadata do
  it { should have_many(:slides) }

  it { should validate_presence_of(:name) }
end
