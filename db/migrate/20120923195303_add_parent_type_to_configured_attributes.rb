class AddParentTypeToConfiguredAttributes < ActiveRecord::Migration
  def change
    add_column :all_aboard_configured_attributes, :type, :string
    add_column :all_aboard_configured_attributes, :perspective_assignment_id, :integer
  end
end
