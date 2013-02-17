# This migration comes from all_aboard (originally 20120331175851)
class CreateAllAboardBoards < ActiveRecord::Migration
  def change
    create_table :all_aboard_boards do |t|
      t.string :name

      t.timestamps
    end
  end
end
