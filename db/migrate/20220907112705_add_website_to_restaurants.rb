class AddWebsiteToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :website, :string
  end
end
