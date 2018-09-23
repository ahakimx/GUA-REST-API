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

ActiveRecord::Schema.define(version: 2018_09_10_120522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.string "anotifable_type"
    t.bigint "anotifable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_admin_notifications_on_actor_id"
    t.index ["anotifable_type", "anotifable_id"], name: "index_admin_notifications_on_anotifable_type_and_anotifable_id"
    t.index ["recipient_id"], name: "index_admin_notifications_on_recipient_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.string "avatar"
    t.text "address"
    t.integer "gender"
    t.string "birth_place"
    t.date "birth_date"
    t.integer "change_request_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_replies", force: :cascade do |t|
    t.bigint "comment_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.text "content"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_replies_on_comment_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comment_replies_on_commentable_type_and_commentable_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "subject_comment_id"
    t.bigint "agent_id"
    t.bigint "user_id"
    t.text "content"
    t.integer "rating"
    t.boolean "read"
    t.date "date_read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_comments_on_agent_id"
    t.index ["subject_comment_id"], name: "index_comments_on_subject_comment_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "insurance_categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_insurance_categories_on_discarded_at"
  end

  create_table "policies", force: :cascade do |t|
    t.bigint "agent_id"
    t.bigint "user_id"
    t.bigint "insurance_category_id"
    t.string "policy_id"
    t.float "premium"
    t.date "insurance_due_date"
    t.string "policy"
    t.date "register_date"
    t.date "premium_date"
    t.string "guarantee_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_policies_on_agent_id"
    t.index ["insurance_category_id"], name: "index_policies_on_insurance_category_id"
    t.index ["user_id"], name: "index_policies_on_user_id"
  end

  create_table "promos", force: :cascade do |t|
    t.bigint "admin_id"
    t.string "title"
    t.string "slug"
    t.text "content"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["admin_id"], name: "index_promos_on_admin_id"
  end

  create_table "request_changes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "agent_id"
    t.boolean "status"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_request_changes_on_agent_id"
    t.index ["user_id"], name: "index_request_changes_on_user_id"
  end

  create_table "subject_comments", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.string "unotifable_type"
    t.bigint "unotifable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.string "content"
    t.string "title"
    t.index ["actor_id"], name: "index_user_notifications_on_actor_id"
    t.index ["recipient_id"], name: "index_user_notifications_on_recipient_id"
    t.index ["unotifable_type", "unotifable_id"], name: "index_user_notifications_on_unotifable_type_and_unotifable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "phone_number"
    t.text "address"
    t.string "birth_place"
    t.date "birth_date"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.integer "gender"
    t.string "fcm_token"
  end

end
