class AddBookIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :book_id, :integer
  end
end
