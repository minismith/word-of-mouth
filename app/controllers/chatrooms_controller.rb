class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(friendship_id: params[:id])
    @message = Message.new
  end
end
