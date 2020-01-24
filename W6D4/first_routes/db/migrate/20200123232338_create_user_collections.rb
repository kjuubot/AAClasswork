class CreateUserCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :user_collections do |t|
      t.integer :user_id, null: false
      t.integer :collection_id, null: false

      t.timestamps
    end
  end
end
