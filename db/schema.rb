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

ActiveRecord::Schema.define(version: 2019_01_09_163230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "desc"
    t.boolean "value"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_question_id"
    t.index ["request_question_id"], name: "index_answers_on_request_question_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "date_of_births", force: :cascade do |t|
    t.string "day"
    t.string "month"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "names", force: :cascade do |t|
    t.boolean "sexo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
  end

  create_table "question_sub_types", force: :cascade do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_type_id"
    t.string "code"
    t.index ["question_type_id"], name: "index_question_sub_types_on_question_type_id"
  end

  create_table "question_types", force: :cascade do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_type_id"
    t.bigint "question_sub_type_id"
    t.index ["question_sub_type_id"], name: "index_questions_on_question_sub_type_id"
    t.index ["question_type_id"], name: "index_questions_on_question_type_id"
  end

  create_table "request_questions", force: :cascade do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id"
    t.bigint "user_request_id"
    t.boolean "value"
    t.index ["question_id"], name: "index_request_questions_on_question_id"
    t.index ["user_request_id"], name: "index_request_questions_on_user_request_id"
  end

  create_table "user_requests", force: :cascade do |t|
    t.string "cpf"
    t.boolean "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "json_result"
    t.boolean "return_web_service"
    t.jsonb "jsonb_result", default: "{}"
  end

  add_foreign_key "answers", "request_questions"
  add_foreign_key "question_sub_types", "question_types"
  add_foreign_key "questions", "question_sub_types"
  add_foreign_key "questions", "question_types"
  add_foreign_key "request_questions", "questions"
  add_foreign_key "request_questions", "user_requests"
end
