class Api::V1::TeamsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def show
    @team = Team.find(params[:id])
  end

  def list
    @teams = current_api_v1_user.teams
    @total = @teams.count
  end

  def search
    keyword = params[:keyword]
    @teams = Team.merge(Team.name_like(keyword).or(Team.description_like(keyword)))
    @total = @teams.count
  end

  def create
    @team = current_api_v1_user.teams.build(team_params)
    current_api_v1_user.save!
  end

  def join
    @team = Team.find(params[:id])
    @team_user = @team.team_users.build(user_id: current_api_v1_user.id)
    @team_user.save!
  end

  private

    def team_params
      params
      .require(:team)
      .permit(:name, :description, :visibility_setting, :gender_restriction, :auto_exit_grace_period)
    end
end
