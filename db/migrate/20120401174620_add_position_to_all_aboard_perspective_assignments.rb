class AddPositionToAllAboardPerspectiveAssignments < ActiveRecord::Migration
  def change
    add_column :all_aboard_perspective_assignments, :position, :integer
  end
end
