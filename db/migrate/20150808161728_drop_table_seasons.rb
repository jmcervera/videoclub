class DropTableSeasons < ActiveRecord::Migration
  def up
    drop_table :seasons
  end

  def down
    create_table "seasons", force: :cascade do |t|
      t.string   "title"
      t.text     "plot"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
