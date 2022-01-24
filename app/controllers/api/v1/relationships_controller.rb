class Api::V1::RelationshipsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create
    @user = User.find(params[:followed_id])
    current_api_v1_user.follow(@user)
  end

  def destroy
    @user = User.find(params[:followed_id])
    current_api_v1_user.unfollow(@user)
  end
end
