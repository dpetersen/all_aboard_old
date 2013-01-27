class AddConfigurationToPerspectiveAssignments < ActiveRecord::Migration
  def change
    add_column :all_aboard_perspective_assignments, :configuration, :hstore
  end
end
