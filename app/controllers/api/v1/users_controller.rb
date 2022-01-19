class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def search
    @users = User.name_like(params[:keyword])
    @total = @users.count
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    @total = @users.count
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @total = @users.count
  end
end
