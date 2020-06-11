class CreateBookshelves < ActiveRecord::Migration[6.0]
  def change
    create_table :bookshelves do |t|
      t.belongs_to :account
      t.string :name
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :bookshelves, :deleted_at
  end
end
