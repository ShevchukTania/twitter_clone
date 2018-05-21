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

ActiveRecord::Schema.define(version: 20180520092422) do

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id_id"
    t.integer "followed_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id_id"], name: "index_relationships_on_followed_id_id"
    t.index ["follower_id_id"], name: "index_relationships_on_follower_id_id"
    t.index [nil, nil], name: "index_relationships_on_followed_and_follower", unique: true
    t.index [nil], name: "index_relationships_on_followed"
    t.index [nil], name: "index_relationships_on_follower"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "text"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

end