class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :country
      t.string :born
      t.string :died
      t.string :books, array: true, default: []
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :authors, :deleted_at 
  end
end
