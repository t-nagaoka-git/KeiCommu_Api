class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def search
    @users = User.name_like(params[:keyword])
    @total = @users.count
  end
end
