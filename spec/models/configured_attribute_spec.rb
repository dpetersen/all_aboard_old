require 'spec_helper'

describe ConfiguredAttribute do
  it { should validate_presence_of(:source_name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:value) }
end
