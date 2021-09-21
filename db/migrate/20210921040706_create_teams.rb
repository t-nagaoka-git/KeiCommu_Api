class CreateTeams < ActiveRecord::Migration[6.0]
  def up
    create_table :teams do |t|
      t.string :name, null: false, comment: "チーム名"
      t.string :description, null: false, comment: "チーム説明"
      t.integer :visibility_setting, null: false, comment: "公開設定（0:クローズ 1:オープン）"
      t.integer :gender_restriction, null: false, comment: "性別制限（0:指定なし 1:男性 2:女性）"
      t.integer :auto_exit_grace_period, null: false, comment: "自動退出猶予期間"

      t.timestamps
    end
  end

  def down
    drop_table :teams
  end
end
