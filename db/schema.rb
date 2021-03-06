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

ActiveRecord::Schema.define(version: 20171221011849) do

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "year", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.date "date"
    t.integer "min_note"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_evaluations_on_course_id"
  end

  create_table "exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "note", limit: 24
    t.bigint "student_id"
    t.bigint "evaluation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_exams_on_evaluation_id"
    t.index ["student_id"], name: "index_exams_on_student_id"
  end

  create_table "professors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_professors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_professors_on_reset_password_token", unique: true
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "last_name"
    t.string "first_name"
    t.integer "document"
    t.string "docket"
    t.string "email"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_students_on_course_id"
  end

  add_foreign_key "evaluations", "courses"
  add_foreign_key "exams", "evaluations"
  add_foreign_key "exams", "students"
  add_foreign_key "students", "courses"
end
