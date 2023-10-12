class ApplicationController < ActionController::API
  # include RackSessionFixController

  before_action :authenticate_user!

  # Ensure your API responds with JSON for authentication errors
  # rescue_from ActionController::InvalidAuthenticityToken do
  #   render json: { error: 'Invalid authenticity token' }, status: :unprocessable_entity
  # end

  # Protect from CSRF attacks by raising an exception.
  # protect_from_forgery with: :null_session, if: -> { request.format.json? }

  before_action :update_allowed_parameters, if: :devise_controller?

  # def after_sign_in_path_for(_resource)
  # Define the path you want users to be redirected to after sign-in
  # For example, you can return the root path or any other path
  # root_path
  # end

  # def after_sign_out_path_for(_resource)
  # Define the path you want users to be redirected to after sign-out
  # For example, you can return the sign-in path or any other path
  # new_user_session_path
  # end

  protected

  def update_allowed_parameters
    # Ensure strong parameters for sign-up and account update
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email password current_password])
  end
end
