class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :number
      t.string :title
      t.text :plot
      t.references :season, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
