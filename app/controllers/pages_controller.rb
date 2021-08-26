class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_incidents
    @user = current_user
    @new_user = User.new
    @incidents = Incident.where(user: @user)
  end

  def log_out
    @user = current_user
  end
end
