require 'spec_helper'

describe AllAboard::PerspectiveAssignmentConfiguredAttribute do
  it { should belong_to(:perspective_assignment) }
  it { should validate_presence_of(:perspective_assignment) }
end
