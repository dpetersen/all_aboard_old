# This migration comes from all_aboard (originally 20130127173242)
class CreateAllAboardSourceConfigurations < ActiveRecord::Migration
  def change
    create_table :all_aboard_source_configuration_metadata do |t|
      t.string :source_name
      t.hstore :configuration

      t.timestamps
    end
  end
end
