class CreateTeamMessages < ActiveRecord::Migration[6.0]
  def up
    create_table :team_messages do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content, null: false, comment: "メッセージ内容"

      t.timestamps
    end
  end

  def down
    drop_table :team_messages
  end
end
