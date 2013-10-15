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

ActiveRecord::Schema.define(version: 20131015183809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: true do |t|
    t.integer "deptno"
    t.string "dname"
    t.string "loc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.integer "empno"
    t.string "ename"
    t.string "job"
    t.integer "mgr"
    t.date "hiredate"
    t.decimal "sal"
    t.decimal "comm"
    t.integer "deptno"
    t.integer "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "never_melts", force: true do |t|
    t.string "pname"
    t.string "descrip"
    t.string "flavor"
    t.string "scoops"
    t.decimal "price"
    t.integer "stock"
    t.string "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
