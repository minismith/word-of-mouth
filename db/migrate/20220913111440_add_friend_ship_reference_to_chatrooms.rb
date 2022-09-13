class AddFriendShipReferenceToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :friendship
  end
end
