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

ActiveRecord::Schema.define(:version => 20130409123846) do

  create_table "projects", :force => true do |t|
    t.string   "key",                            :null => false
    t.text     "description"
    t.string   "ip"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "user_id"
    t.boolean  "completed",   :default => false, :null => false
  end

  add_index "projects", ["key"], :name => "index_naming_projects_on_key", :unique => true
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "suggestions", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "project_id", :null => false
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "suggestions", ["project_id", "name"], :name => "index_suggestions_on_naming_project_id_and_name", :unique => true
  add_index "suggestions", ["user_id"], :name => "index_suggestions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "authentication_token", :null => false
    t.string   "ip"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "suggestion_id", :null => false
    t.integer  "user_id",       :null => false
    t.string   "vote",          :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "reason"
  end

  add_index "votes", ["user_id", "suggestion_id"], :name => "index_votes_on_user_id_and_suggestion_id", :unique => true

end
