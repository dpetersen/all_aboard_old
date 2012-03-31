require 'spec_helper'

describe Board do
  it { should have_many(:slides) }
  it { should validate_presence_of(:name) }
end
