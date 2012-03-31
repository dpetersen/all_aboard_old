class CreatePerspectiveAssignments < ActiveRecord::Migration
  def change
    create_table :perspective_assignments do |t|
      t.references :slide
      t.string :source_name
      t.string :perspective_name

      t.timestamps
    end
  end
end
