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
    t.string   "efficiency"
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

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "ships", :force => true do |t|
    t.integer  "max_energy",    :default => 10
    t.integer  "max_shield",    :default => 7
    t.integer  "max_hardpoint", :default => 2
    t.integer  "max_speed",     :default => 2
    t.integer  "max_fuel",      :default => 3
    t.integer  "max_crew",      :default => 4
    t.integer  "max_hull",      :default => 5
    t.integer  "max_cargo",     :default => 10
    t.integer  "max_attack",    :default => 5
    t.text     "cargo_bay"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.integer  "energy",            :default => 0
    t.integer  "shield",            :default => 0
    t.integer  "shield_efficiency", :default => 1
    t.integer  "hardpoint",         :default => 0
    t.integer  "speed",             :default => 0
    t.integer  "fuel",              :default => 0
    t.integer  "crew",              :default => 0
    t.integer  "hull",              :default => 0
    t.integer  "hull_efficiency",   :default => 1
    t.integer  "credit",            :default => 0
    t.integer  "attack",            :default => 0
    t.integer  "attack_efficiency", :default => 1
    t.integer  "cargo",             :default => 0
    t.text     "cargo_bay"
    t.integer  "round",             :default => 0
    t.integer  "vp",                :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

end
