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

ActiveRecord::Schema.define(:version => 20120226223535) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["story_id"], :name => "index_comments_on_story_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "stories", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stories", ["state"], :name => "index_stories_on_state"
  add_index "stories", ["title"], :name => "index_stories_on_title"
  add_index "stories", ["user_id"], :name => "index_stories_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["role"], :name => "index_users_on_role"

end
