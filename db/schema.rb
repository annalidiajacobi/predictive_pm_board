# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_22_232928) do
  create_table "lists", force: :cascade do |t|
    t.integer "project_id", null: false
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_lists_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_histories", force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "from_list_id", null: false
    t.integer "to_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_list_id"], name: "index_task_histories_on_from_list_id"
    t.index ["task_id"], name: "index_task_histories_on_task_id"
    t.index ["to_list_id"], name: "index_task_histories_on_to_list_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "list_id", null: false
    t.integer "project_id", null: false
    t.string "title"
    t.text "description"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_tasks_on_list_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  add_foreign_key "lists", "projects"
  add_foreign_key "task_histories", "from_lists"
  add_foreign_key "task_histories", "tasks"
  add_foreign_key "task_histories", "to_lists"
  add_foreign_key "tasks", "lists"
  add_foreign_key "tasks", "projects"
end
