class RemoveBooksFromPublisher < ActiveRecord::Migration[6.0]
  def change
    remove_column :publishers, :books, :string
  end
end
