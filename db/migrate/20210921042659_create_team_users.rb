class CreateTeamUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :team_users do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :team_users
  end
end
