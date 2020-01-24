class AddIndexToCollection < ActiveRecord::Migration[5.2]
  def change
    add_index :collections, [:artwork_id, :collection_id], unique: true
  end
end
