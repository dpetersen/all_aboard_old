# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130127173242) do

  create_table "all_aboard_boards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "all_aboard_configured_attributes", :force => true do |t|
    t.string   "source_name"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "type"
    t.integer  "perspective_assignment_id"
  end

  create_table "all_aboard_perspective_assignments", :force => true do |t|
    t.integer  "slide_id"
    t.string   "source_name"
    t.string   "perspective_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "position"
  end

  create_table "all_aboard_slides", :force => true do |t|
    t.integer  "board_id"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "layout_name"
  end

  create_table "all_aboard_source_configurations", :force => true do |t|
    t.string   "source_name"
    t.hstore   "configuration"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
