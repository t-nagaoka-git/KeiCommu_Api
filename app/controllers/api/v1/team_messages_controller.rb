class Api::V1::TeamMessagesController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    @team_messages = Team
      .eager_load(team_messages: :user)
      .find(params[:team_id])
      .team_messages
    @total = @team_messages.count
  end

  def create
    @team = Team.find(params[:team_id])
    @team_message = @team
      .team_messages
      .build(user_id: current_api_v1_user.id, content: params[:content])
    @team_message.save!
  end
end