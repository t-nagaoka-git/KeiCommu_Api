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
    if params[:content].present?
      @team_message = @team
      .team_messages
      .build(user_id: current_api_v1_user.id, content: params[:content])
    else
      @team_message = @team
      .team_messages
      .build(user_id: current_api_v1_user.id, image: params[:image])
    end
    @team_message.save!
    TeamRoomsChannel.broadcast_to(
      @team,
      {
        id: @team_message.id,
        content: @team_message.content,
        image: @team_message.image,
        created_at: @team_message.created_at,
        user: {
          id: @team_message.user.id,
          name: @team_message.user.name,
          image: @team_message.user.image
        }
      }
    )
  end
end