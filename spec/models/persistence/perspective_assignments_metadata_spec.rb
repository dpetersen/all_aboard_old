require 'spec_helper'

describe AllAboard::Persistence::PerspectiveAssignmentsMetadata do
  it { should validate_presence_of(:slide_id) }
  it { should validate_presence_of(:source_name) }
  it { should validate_presence_of(:perspective_name) }
  it { should validate_presence_of(:position) }

  it { should respond_to(:configuration) }
end
