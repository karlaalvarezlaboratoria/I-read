class RemoveBooksFromAuthor < ActiveRecord::Migration[6.0]
  def change
    remove_column :authors, :books, :string
  end
end
