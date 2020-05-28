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

ActiveRecord::Schema.define(version: 3) do

  create_table "concepts", force: :cascade do |t|
    t.string "data_structure"
    t.string "task"
    t.text "full_description"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "student_id"
    t.integer "concept_id"
    t.string "last_studied"
    t.integer "comfort_level"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "track"
  end

end
