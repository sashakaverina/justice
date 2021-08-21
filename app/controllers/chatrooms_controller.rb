class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

 def update
  @chatroom = Chatroom.find(params[:id])
  authorize @chatroom
  @chatroom.update(chat_params)
 end

private

 def chat_params
  # TODO: check your model, might be different than mine
  params.require(:chatroom).permit(:sender_id, :recipient_id, :status)
 end

end
