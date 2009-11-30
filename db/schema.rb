# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091130173611) do

  create_table "equipes", :force => true do |t|
    t.integer  "equipe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", :force => true do |t|
    t.string   "name"
    t.date     "affectation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "secteurs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "secteurs_work_sessions", :force => true do |t|
    t.integer  "secteur_id"
    t.integer  "work_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "nom"
    t.string   "prenom"
    t.string   "email"
    t.integer  "equipe_id"
    t.string   "crypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promotion_id"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "last_request_at"
    t.string   "single_access_token"
  end

  create_table "work_sessions", :force => true do |t|
    t.string   "position"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "timespan"
  end

end
