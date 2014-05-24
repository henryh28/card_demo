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

ActiveRecord::Schema.define(:version => 20140523162105) do

  create_table "cards", :force => true do |t|
    t.string   "card_type"
    t.string   "effect"
    t.string   "modifier"
    t.string   "flavor_text"
    t.string   "cost"
    t.integer  "deck_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "decks", :force => true do |t|
    t.string "name"
    t.string "deck_type"
  end

  create_table "games", :force => true do |t|
    t.string "name"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "credit",     :default => 0
    t.integer  "energy",     :default => 0
    t.integer  "attack",     :default => 0
    t.integer  "shield",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "ships", :force => true do |t|
    t.integer  "max_energy",    :default => 5
    t.integer  "max_shield",    :default => 5
    t.integer  "max_hardpoint", :default => 1
    t.integer  "max_speed",     :default => 2
    t.integer  "max_fuel",      :default => 3
    t.integer  "max_crew",      :default => 3
    t.integer  "max_hull",      :default => 5
    t.integer  "max_cargo",     :default => 10
    t.text     "cargo_bay"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.integer  "energy"
    t.integer  "shield"
    t.integer  "hardpoint"
    t.integer  "speed"
    t.integer  "fuel"
    t.integer  "crew"
    t.integer  "hull"
    t.integer  "credit"
    t.integer  "attack"
    t.integer  "cargo"
    t.text     "cargo_bay"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
