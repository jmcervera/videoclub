class AddIndexToPurchases < ActiveRecord::Migration
  def change
    add_index :purchases, :purchased_at
    add_index :purchases, :expire_at
  end
end
