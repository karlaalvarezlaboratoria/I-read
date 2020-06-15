class ChangeRateToHaveDefaultValueInReviews < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :rate, :integer, default: 0
  end
end
