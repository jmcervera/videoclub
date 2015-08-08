class AddIndexToItems < ActiveRecord::Migration
  def change
    add_index :items, :title
  end
end
