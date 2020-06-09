class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :genre, default: 0
      t.string :publisher
      t.string :release_year
      t.text :description
      t.integer :format_type, default: 0
      t.string :length
      t.integer :length_type, default: 0
      t.string :isbn
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :books, :deleted_at
  end
end
