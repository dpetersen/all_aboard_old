# This migration comes from all_aboard (originally 20120331210638)
class AddLayoutNameToAllAboardSlides < ActiveRecord::Migration
  def change
    add_column :all_aboard_slides, :layout_name, :string
  end
end
