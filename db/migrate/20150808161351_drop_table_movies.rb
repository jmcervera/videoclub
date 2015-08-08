class DropTableMovies < ActiveRecord::Migration
  def up
    drop_table :movies
  end

  def down
    create_table "movies", force: :cascade do |t|
      t.string   "title"
      t.text     "plot"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
