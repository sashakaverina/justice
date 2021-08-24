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
      Notification.create(recipient_id: current_user)
      raise
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
      ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: { message: @message })
    )
    else
      render "chatrooms/show"
    end

  end

  private

  def message_params
   params.require(:message).permit(:content)
  end
end

