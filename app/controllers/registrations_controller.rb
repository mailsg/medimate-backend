class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        render json: { code: 200, message: 'Signed up successfully', data: resource }, status: :ok
      else
        expire_data_after_sign_in!
        render json: { result: 'success_with_notice', notice: "signed_up_but_#{resource.inactive_message}" }
      end
    else
      render json: { message: 'User could not be created successfully',
                     errors: resource.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    resource_updated = update_resource(resource, account_update_params)
    if resource_updated
      render json: { code: 200, message: 'Updated successfully', data: resource }, status: :ok
    else
      render json: { message: 'User could not be updated',
                     errors: resource.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    resource.destroy
    render json: { code: 200, message: 'User deleted successfully', data: resource }, status: :ok
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
