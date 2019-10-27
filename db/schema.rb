# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_22_024816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "newsletters", force: :cascade do |t|
    t.string "title", null: false
    t.date "release_date", null: false
    t.string "lyra_id"
    t.boolean "published", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["published"], name: "index_newsletters_on_published"
  end

  create_table "stories", force: :cascade do |t|
    t.bigint "newsletter_id", null: false
    t.string "title", null: false
    t.string "tag", null: false
    t.string "lyra_id"
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["newsletter_id"], name: "index_stories_on_newsletter_id"
  end

  add_foreign_key "stories", "newsletters"
end
