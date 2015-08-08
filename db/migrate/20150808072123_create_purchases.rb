class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.datetime :purchased_at
      t.datetime :expire_at

      t.timestamps null: false
    end
  end
end
