class AllAboard::PerspectiveAssignmentConfiguredAttribute < AllAboard::ConfiguredAttribute
  belongs_to :perspective_assignment, class_name: "AllAboard::Persistence::PerspectiveAssignmentsMetadata"

  validates :perspective_assignment, presence: true
  attr_accessible :perspective_assignment_id
end
