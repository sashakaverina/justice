class Api::V1::AuthController < ApplicationController
  def auth
    status = current_user.valid_password?(params[:password])
    render json: { status: status }
  end
end
