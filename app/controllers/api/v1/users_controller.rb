class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate, only: :create
  skip_before_action :verify_authenticity_token, only: :create

  def index
    render json: users
  end

  def show
    # if current_user
      render json: current_user, status: :ok
    # else
    #   render json: 'Not authenticated', status: :unauthorized
    # end
  end

  def create
    user = User.create(create_user_params)
    if user.valid?
      session[:user_id] = user.id # piece that logs our user in
      set_csrf_token!
      render json: user, status: :created
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # def destroy
  #   user = User.find_by(id: params[:id])
  #   if user
  #     user.destroy
  #     head :no_content
  #   else
  #     render json: 'User does not exist', status: :not_found
  #   end
  # end

  def update
    @current_user.update(update_user_params)
    if @current_user.valid?
      render json: @current_user, status: :ok
    else
      render json: @current_user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def create_user_params
    params.permit(:username, :email, :password)
  end

  def update_user_params
    params.permit(:username)
  end
end
