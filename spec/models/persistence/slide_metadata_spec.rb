require 'spec_helper'

describe AllAboard::Persistence::SlideMetadata do
  it { should have_many(:perspective_assignments) }

  it { should validate_presence_of(:board_id) }
  it { should validate_presence_of(:layout_name) }
end
