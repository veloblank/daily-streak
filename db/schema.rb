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

ActiveRecord::Schema.define(version: 20171216124503) do

  create_table "lists", force: :cascade do |t|
    t.text    "name"
    t.integer "user_id"
  end

  create_table "props", force: :cascade do |t|
    t.datetime "date"
    t.text     "title"
    t.datetime "time"
    t.text     "sport"
    t.text     "away_team"
    t.text     "home_team"
    t.text     "away_team_url"
    t.text     "home_team_url"
    t.boolean  "status_started?"
    t.integer  "confidence"
  end

  create_table "users", force: :cascade do |t|
    t.text    "username"
    t.text    "email"
    t.text    "password_digest"
    t.integer "streak"
  end

end
