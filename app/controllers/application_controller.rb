class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  helper_method :current_user, :user_signed_in?

  before_action :set_default_response

  def set_default_response
    @result = true
    @status = 200
    @message = ""
    @total = 0
  end
end
