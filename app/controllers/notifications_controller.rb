class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).where(recipient_id: current_user)
    render json: @notifications.count
  end
end
