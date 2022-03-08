class Api::V1::MicropostsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    @microposts = current_api_v1_user.microposts
    @liked_micropost_ids = @current_api_v1_user.likes
      .where(micropost_id: @microposts.pluck(:id))
      .pluck(:micropost_id)
  end

  def timeline
    @microposts = current_api_v1_user.feed
    @liked_micropost_ids = @current_api_v1_user.likes
      .where(micropost_id: @microposts.except(:order).pluck(:id))
      .pluck(:micropost_id)
  end

  def create
    @micropost = current_api_v1_user.microposts.build(micropost_params)
    @micropost.save!
  end

  def like
    like = current_api_v1_user.likes.build(micropost_id: params[:id])
    like.save!
  end

  def unlike
    current_api_v1_user.likes.find_by(micropost_id: params[:id]).destroy
  end

  private

    def micropost_params
      params.permit(:content, :image)
    end
end
