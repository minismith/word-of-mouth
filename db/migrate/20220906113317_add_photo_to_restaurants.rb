class AddPhotoToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :photo, :string
  end
end
