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

ActiveRecord::Schema.define(version: 2020_06_19_191212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
    t.string "username", default: "", null: false
    t.string "name"
    t.string "avatar"
    t.string "slug"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_accounts_on_slug", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "born"
    t.string "died"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_authors_on_deleted_at"
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_id", null: false
    t.index ["author_id", "book_id"], name: "index_authors_books_on_author_id_and_book_id"
    t.index ["book_id", "author_id"], name: "index_authors_books_on_book_id_and_author_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.integer "genre", default: 0
    t.string "release_year"
    t.text "description"
    t.integer "format_type", default: 0
    t.string "length"
    t.integer "length_type", default: 0
    t.string "isbn"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.bigint "publisher_id"
    t.index ["deleted_at"], name: "index_books_on_deleted_at"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "books_bookshelves", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "bookshelf_id", null: false
    t.index ["book_id", "bookshelf_id"], name: "index_books_bookshelves_on_book_id_and_bookshelf_id"
    t.index ["bookshelf_id", "book_id"], name: "index_books_bookshelves_on_bookshelf_id_and_book_id"
  end

  create_table "bookshelves", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name"
    t.text "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_bookshelves_on_account_id"
    t.index ["deleted_at"], name: "index_bookshelves_on_deleted_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "book_id"
    t.bigint "bookshelf_id"
    t.integer "book_progress"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_progresses_on_account_id"
    t.index ["book_id"], name: "index_progresses_on_book_id"
    t.index ["bookshelf_id"], name: "index_progresses_on_bookshelf_id"
    t.index ["deleted_at"], name: "index_progresses_on_deleted_at"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_publishers_on_deleted_at"
  end

  create_table "rate_and_reviews", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "book_id"
    t.integer "rate"
    t.text "review"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_rate_and_reviews_on_account_id"
    t.index ["book_id"], name: "index_rate_and_reviews_on_book_id"
    t.index ["deleted_at"], name: "index_rate_and_reviews_on_deleted_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "book_id"
    t.integer "rate", default: 0
    t.text "review_comment"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_reviews_on_account_id"
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["deleted_at"], name: "index_reviews_on_deleted_at"
  end

end
