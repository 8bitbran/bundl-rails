# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_06_230402) do

  create_table "events", force: :cascade do |t|
    t.integer "group_id"
    t.string "title"
    t.text "description"
    t.string "location"
    t.datetime "starttime"
    t.datetime "endtime"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.integer "organizer_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.boolean "going"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "group_id"
    t.integer "topic_id"
  end

end
