class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception

  before_action :authenticate

  def authenticate
    @current_user ||= User.find(session[:user_id])
    # new authenticity token on each request for authenticated users
    set_csrf_token!
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Not authorized" }, status: :unauthorized
  end
  
  def set_csrf_token!
    cookies["CSRF-TOKEN"] = form_authenticity_token
  end
  # include ActionController::Cookies
  # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # before_action :authorize

  # private

  # def authorize
  #   @current_user = User.find_by(id: session[:user_id])

  #   render json: { errors: ['Not authorized'] }, status: :unauthorized unless @current_user
  # end

  # def render_unprocessable_entity_response(exception)
  #   render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  # end
end
