class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :account
      t.belongs_to :book
      t.integer :rate
      t.text :review
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :reviews, :deleted_at
  end
end
