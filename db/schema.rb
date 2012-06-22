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

ActiveRecord::Schema.define(:version => 20120622174435) do

  create_table "marked_problems", :force => true do |t|
    t.string   "status"
    t.integer  "user_id"
    t.integer  "problem_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "marked_problems", ["problem_id"], :name => "index_marked_problems_on_problem_id"
  add_index "marked_problems", ["user_id", "problem_id"], :name => "index_marked_problems_on_user_id_and_problem_id"
  add_index "marked_problems", ["user_id"], :name => "index_marked_problems_on_user_id"

  create_table "problems", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.text     "input_format"
    t.text     "output_format"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "solution_file"
    t.string   "solution_file_file_name"
    t.string   "solution_file_content_type"
    t.integer  "solution_file_file_size"
    t.datetime "solution_file_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "admin"
  end

end
