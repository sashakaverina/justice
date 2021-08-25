class MessagesController < ApplicationController

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      if @chatroom.sender == current_user
        MessageNotification.with(recipient_id: @chatroom.recipient).deliver(@chatroom.recipient)
      else
        MessageNotification.with(recipient_id: @chatroom.sender).deliver(@chatroom.sender)
      end
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")


    else
      render "chatrooms/show"
    end
    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: { message: @message })
    )

  end

  private

  def message_params
   params.require(:message).permit(:content)
  end
end

