class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message
    if @message.save
      if @chatroom.sender == current_user
        MessageNotification.with(recipient: @chatroom.recipient, chatroom: @chatroom).deliver(@chatroom.recipient)
      else
        MessageNotification.with(recipient: @chatroom.sender, chatroom: @chatroom).deliver(@chatroom.sender)
      end
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
    ChatroomChannel.broadcast_to(
      @chatroom,
      {
        mine: render_to_string(partial: "message_mine", locals: { message: @message }),
        their: render_to_string(partial: "message_their", locals: { message: @message }),
        userId: @message.user.id
      }
    )
    authorize @message
  end

  private

  def message_params
   params.require(:message).permit(:content)
  end
end
