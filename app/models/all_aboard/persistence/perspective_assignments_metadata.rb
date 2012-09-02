module AllAboard::Persistence
  class PerspectiveAssignmentsMetadata < ActiveRecord::Base
    self.table_name = "all_aboard_perspective_assignments"

    validates :slide_id, :source_name, :perspective_name, :position, presence: true

    attr_accessible :source_name, :perspective_name, :position
  end
end
