class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @chatroom = Chatroom.find(params[:id])
    stream_for @chatroom
  end

  def unsubscribed
    stop_stream_from @chatroom

    # Any cleanup needed when channel is unsubscribed
  end
end
