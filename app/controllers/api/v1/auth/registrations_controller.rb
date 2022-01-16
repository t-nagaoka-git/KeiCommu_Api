class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

    def sign_up_params
      params.permit(:email, :password, :password_confirmation, :name, :gender)
    end

    def account_update_params
      params.require(:registration).permit(:email, :name, :description)
    end
end