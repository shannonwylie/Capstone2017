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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170306015543) do

  create_table "hunts", force: :cascade do |t|
    t.string   "title"
    t.boolean  "active"
    t.boolean  "published"
    t.boolean  "public"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "start_location"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "pirate_hunts", force: :cascade do |t|
    t.boolean  "completed"
    t.integer  "user_id"
    t.integer  "hunt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "points"
  end

  create_table "pirate_tasks", force: :cascade do |t|
    t.boolean  "answer_uploaded"
    t.boolean  "completed"
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "hunt_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "submission_file_name"
    t.string   "submission_content_type"
    t.integer  "submission_file_size"
    t.datetime "submission_updated_at"
    t.integer  "pirate_hunt_id"
    t.string   "qa_submission"
  end

  add_index "pirate_tasks", ["pirate_hunt_id"], name: "index_pirate_tasks_on_pirate_hunt_id"

  create_table "tasks", force: :cascade do |t|
    t.integer  "task_type"
    t.integer  "points"
    t.string   "prompt"
    t.string   "clue"
    t.string   "correct_answer"
    t.integer  "hunt_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "display_name",           default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
