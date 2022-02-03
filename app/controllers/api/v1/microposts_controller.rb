class Api::V1::MicropostsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    @microposts = current_api_v1_user.microposts
  end

  def timeline
    @microposts = current_api_v1_user.feed
  end

  def create
    @micropost = current_api_v1_user.microposts.build(micropost_params)
    @micropost.save!
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
