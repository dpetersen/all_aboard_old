class RemoveConfigurableAttributesTables < ActiveRecord::Migration
  def up
    drop_table :all_aboard_configured_attributes
  end

  def down
    # No need to come back from this one.
    raise ActiveRecord::IrreversibleMigration
  end
end
