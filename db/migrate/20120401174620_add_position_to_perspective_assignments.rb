class AddPositionToPerspectiveAssignments < ActiveRecord::Migration
  def change
    add_column :perspective_assignments, :position, :integer
  end
end
