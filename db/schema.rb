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

ActiveRecord::Schema.define(:version => 20120426022240) do

  create_table "books", :force => true do |t|
    t.integer "category_id"
    t.string  "name"
    t.string  "author"
    t.string  "editor"
    t.integer "unit_id"
  end

  create_table "categories", :force => true do |t|
    t.string "description"
  end

  create_table "courses", :force => true do |t|
    t.string "description"
  end

  create_table "disciplines", :force => true do |t|
    t.integer "course_id"
    t.string  "description"
  end

  create_table "evaluations", :force => true do |t|
    t.integer "discipline_id"
    t.integer "student_id"
    t.float   "evaluation1"
    t.float   "evaluation2"
    t.integer "period"
    t.boolean "status"
    t.float   "exame"
  end

  create_table "lacks", :force => true do |t|
    t.integer "discipline_id"
    t.integer "student_id"
    t.date    "date"
    t.integer "num_lacks"
  end

  create_table "locations", :force => true do |t|
    t.integer "book_id"
    t.integer "student_id"
    t.date    "date_location"
    t.date    "date_devolution"
    t.boolean "returned"
  end

  create_table "students", :force => true do |t|
    t.string  "name"
    t.date    "birth"
    t.string  "rg",        :limit => 13
    t.string  "cpf",       :limit => 14
    t.string  "address"
    t.string  "phone",     :limit => 15
    t.integer "course_id"
    t.string  "password",  :limit => 10
    t.integer "unit_id"
  end

  create_table "units", :force => true do |t|
    t.string "description"
    t.string "address"
    t.string "name"
    t.string "phone",       :limit => 15
  end

  create_table "units_courses", :force => true do |t|
    t.integer "unit_id"
    t.integer "course_id"
  end

end
