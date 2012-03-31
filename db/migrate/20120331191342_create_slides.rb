class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.references :board
      t.integer :position

      t.timestamps
    end
  end
end
