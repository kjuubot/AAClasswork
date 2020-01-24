class RemoveCollectionIdFromUserCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_collections, :collection_id
  end
end
