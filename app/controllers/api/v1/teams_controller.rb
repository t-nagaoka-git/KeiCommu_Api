class Api::V1::TeamsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def list
    @teams = current_api_v1_user.teams
    @total = @teams.count
  end

  def create
    @team = current_api_v1_user.teams.build(team_params)
    current_api_v1_user.save!
  end

  private

    def team_params
      params
      .require(:team)
      .permit(:name, :description, :visibility_setting, :gender_restriction, :auto_exit_grace_period)
    end
end
