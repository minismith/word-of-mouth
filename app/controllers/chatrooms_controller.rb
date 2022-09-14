class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(friendship_id: params[:id])
    @message = Message.new
  end

  def index
    @user_friendships = Friendship.where(friend_id: current_user).or(Friendship.where(user_id: current_user))
    @chatrooms = Chatroom.where(friendship_id: @user_friendships)
  end
end
