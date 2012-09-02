module AllAboard::Persistence
  class BoardMetadata < ActiveRecord::Base
    self.table_name = "all_aboard_boards"
    has_many(
      :slides,
      class_name: "AllAboard::Persistence::SlideMetadata",
      foreign_key: "board_id"
    )

    validates :name, presence: true

    attr_accessible :name
  end
end
