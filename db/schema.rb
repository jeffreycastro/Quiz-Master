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

ActiveRecord::Schema.define(version: 20161128081040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "exam_item_id"
    t.index ["exam_item_id"], name: "index_answers_on_exam_item_id", using: :btree
  end

  create_table "exam_items", force: :cascade do |t|
    t.text     "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "exam_id"
    t.integer  "seq_num"
    t.index ["exam_id"], name: "index_exam_items_on_exam_id", using: :btree
  end

  create_table "exam_result_items", force: :cascade do |t|
    t.integer  "exam_result_id"
    t.integer  "exam_item_id"
    t.integer  "seq_num"
    t.text     "answer"
    t.boolean  "is_correct",     default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["exam_item_id"], name: "index_exam_result_items_on_exam_item_id", using: :btree
    t.index ["exam_result_id"], name: "index_exam_result_items_on_exam_result_id", using: :btree
  end

  create_table "exam_results", force: :cascade do |t|
    t.integer  "exam_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.decimal  "score",      default: "0.0"
    t.index ["exam_id"], name: "index_exam_results_on_exam_id", using: :btree
  end

  create_table "exams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
