class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.string :title
      t.text :plot

      t.timestamps null: false
    end
  end
end
