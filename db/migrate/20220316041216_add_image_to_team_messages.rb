class AddImageToTeamMessages < ActiveRecord::Migration[6.0]
  def up
    add_column :team_messages, :image, :string
  end

  def down
    remove_column :team_messages, :image
  end
end
