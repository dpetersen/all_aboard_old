require 'spec_helper'

describe AllAboard::Persistence::SourceConfigurationMetadata do
  it { should validate_presence_of(:source_name) }
  it { should validate_presence_of(:configuration) }

  it { should respond_to(:configuration) }
end
