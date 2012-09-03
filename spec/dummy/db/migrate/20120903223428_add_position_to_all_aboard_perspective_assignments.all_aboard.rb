# This migration comes from all_aboard (originally 20120401174620)
class AddPositionToAllAboardPerspectiveAssignments < ActiveRecord::Migration
  def change
    add_column :all_aboard_perspective_assignments, :position, :integer
  end
end
