class AddIndicesToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, :liker_id
    add_index :likes, [:liker_id, :likable_id, :likable_type], unique: true
  end
end
