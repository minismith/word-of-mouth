class AddOpeningHoursToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :opening_hours, :text
  end
end
