class CreateJoinTableBookBookshelves < ActiveRecord::Migration[6.0]
  def change
    create_join_table :books, :bookshelves do |t|
      t.index [:book_id, :bookshelf_id]
      t.index [:bookshelf_id, :book_id]
    end
  end
end
