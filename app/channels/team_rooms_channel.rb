class TeamRoomsChannel < ApplicationCable::Channel
  def subscribed
    @team = Team.find(params[:id])
    stream_for @team
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
