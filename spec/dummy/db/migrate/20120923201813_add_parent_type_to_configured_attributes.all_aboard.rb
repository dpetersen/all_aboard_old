# This migration comes from all_aboard (originally 20120923195303)
class AddParentTypeToConfiguredAttributes < ActiveRecord::Migration
  def change
    add_column :all_aboard_configured_attributes, :type, :string
    add_column :all_aboard_configured_attributes, :perspective_assignment_id, :integer
  end
end
