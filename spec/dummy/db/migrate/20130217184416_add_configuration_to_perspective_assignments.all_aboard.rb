# This migration comes from all_aboard (originally 20130127191313)
class AddConfigurationToPerspectiveAssignments < ActiveRecord::Migration
  def change
    add_column :all_aboard_perspective_assignments, :configuration, :hstore
  end
end
