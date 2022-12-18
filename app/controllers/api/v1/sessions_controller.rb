class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create
  skip_before_action :verify_authenticity_token, only: :create

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      set_csrf_token!
      render json: user
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  # def logged_in
  #   if @current_user
  #     render json: {
  #       logged_in: true,
  #       user: @current_user
  #     }
  #   else
  #     render json: {
  #       logged_in: false
  #     }
  #   end
  # end

  def destroy
    session.delete(:user_id)
    head :no_content
  end
end
