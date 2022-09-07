class SetLikesToZero < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :likes, :integer, default: 0
  end
end
