require 'spec_helper'

describe AllAboard::SourceConfiguredAttribute do
  it { should validate_presence_of(:source_name) }
end
