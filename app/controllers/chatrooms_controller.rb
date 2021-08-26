class ChatroomsController < ApplicationController

  skip_before_action :verify_authenticity_token
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    # @messages = Message.unread_by(current_user)
    # @messages.mark_as_read! :all, for: current_user
    Notification.where(recipient_id: current_user).destroy_all
    authorize @chatroom

    respond_to do |format|
      format.html
      format.json { render json: { messages: @messages } }
    end
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
