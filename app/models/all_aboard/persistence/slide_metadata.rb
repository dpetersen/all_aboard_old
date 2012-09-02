module AllAboard::Persistence
  class SlideMetadata < ActiveRecord::Base
    self.table_name = "all_aboard_slides"

    has_many(
      :perspective_assignments,
      class_name: "AllAboard::Persistence::PerspectiveAssignmentsMetadata",
      foreign_key: "slide_id"
    )

    validates :board_id, :layout_name, presence: true

    attr_accessible :layout_name
  end
end
