class SessionsController < Devise::SessionsController
  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   sign_in(resource_name, resource)
  #   render json: { result: 'success', user: resource }
  # end

  # def destroy
  #   render json: { result: 'success' }
  # end

  # private

  # def verify_signed_out_user
  #   missing_auth_token && return unless request.headers['Authorization'].present?
  # end

  # def missing_auth_token
  #   render json: { result: 'failed', error: 'missing_auth_token' }, status: :unauthorized
  # end
  respond_to :json

  private

  def respond_with(resource, options={})
    render json: {
      status: { code: 200, message: 'User signed in successfully', data: current_user }
    }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: 200,
        message: 'Signed out successfully'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'User has no active session'
      }, status: :unauthorized
    end
  end
end
