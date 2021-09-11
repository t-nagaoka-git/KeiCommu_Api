class Api::V1::MicropostsController < ApplicationController
  def create
    @micropost = User.find(params[:user_id]).microposts.build(micropost_params)
    @micropost.save!
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
