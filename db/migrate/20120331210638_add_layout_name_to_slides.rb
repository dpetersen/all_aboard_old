class AddLayoutNameToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :layout_name, :string
  end
end
