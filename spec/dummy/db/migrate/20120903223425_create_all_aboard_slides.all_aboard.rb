# This migration comes from all_aboard (originally 20120331191342)
class CreateAllAboardSlides < ActiveRecord::Migration
  def change
    create_table :all_aboard_slides do |t|
      t.references :board
      t.integer :position

      t.timestamps
    end
  end
end
