class CreatePublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :country
      t.string :books, array: true, default: []
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :publishers, :deleted_at 
  end
end
