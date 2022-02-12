class Api::V1::TeamMessagesController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    @team_messages = Team
      .eager_load(team_messages: :user)
      .find(params[:team_id])
      .team_messages
    @total = @team_messages.count
    render action: :index
  end
end