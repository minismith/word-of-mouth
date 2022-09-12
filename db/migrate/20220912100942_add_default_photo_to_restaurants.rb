class AddDefaultPhotoToRestaurants < ActiveRecord::Migration[7.0]
  def change
    change_column_default :restaurants, :photo, "https://res.cloudinary.com/dg6mudunt/image/upload/v1662977333/ali-inay-y3aP9oo9Pjc-unsplash_g7gvan.jpg"
  end
end
