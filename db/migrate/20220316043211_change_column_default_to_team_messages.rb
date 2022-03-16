class ChangeColumnDefaultToTeamMessages < ActiveRecord::Migration[6.0]
  def change
    change_column_default :team_messages, :content, from: nil, to: ''
  end
end
