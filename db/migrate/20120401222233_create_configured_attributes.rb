class CreateConfiguredAttributes < ActiveRecord::Migration
  def change
    create_table :configured_attributes do |t|
      t.string :source_name
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
