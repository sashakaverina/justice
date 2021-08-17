class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = Messages.all
    authorize @chatroom
  end
end
