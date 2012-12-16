module AllAboard::Persistence
  class PerspectiveAssignmentsMetadata < ActiveRecord::Base
    self.table_name = "all_aboard_perspective_assignments"

    has_many :perspective_assignment_configured_attributes, foreign_key: :perspective_assignment_id

    validates :slide_id, :source_name, :perspective_name, :position, presence: true

    attr_accessible :source_name, :perspective_name, :position
  end
end
