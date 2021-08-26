class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :update]

  def index
    @chatrooms = policy_scope(Chatroom).where(sender_id: current_user).or(Chatroom.where(recipient_id: current_user))
  end

  def show
    @message = Message.new
    # @messages = Message.unread_by(current_user)
    # @messages.mark_as_read! :all, for: current_user
    Notification.where(recipient_id: current_user).destroy_all


    respond_to do |format|
      format.html
      format.json { render json: { messages: @messages } }
    end
  end

 def update
  @chatroom.update(chat_params)
 end

private

  def chat_params
    # TODO: check your model, might be different than mine
    params.require(:chatroom).permit(:sender_id, :recipient_id, :status)
  end

 def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
end
