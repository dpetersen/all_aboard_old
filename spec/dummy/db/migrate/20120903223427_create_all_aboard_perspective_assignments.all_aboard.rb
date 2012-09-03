# This migration comes from all_aboard (originally 20120331221005)
class CreateAllAboardPerspectiveAssignments < ActiveRecord::Migration
  def change
    create_table :all_aboard_perspective_assignments do |t|
      t.references :slide
      t.string :source_name
      t.string :perspective_name

      t.timestamps
    end
  end
end
