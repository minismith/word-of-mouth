class RemoveWebsiteFromRestaurants < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :website, :string
  end
end
