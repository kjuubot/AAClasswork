class EditColNamesInPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_url
    remove_column :posts, :author_url

    add_column :posts, :sub_id, :integer, null: false
    add_column :posts, :author_id, :integer, null: false

    add_index :posts, :sub_id
    add_index :posts, :author_id
  end
end
