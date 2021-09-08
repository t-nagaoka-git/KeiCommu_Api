class CreateMicroposts < ActiveRecord::Migration[6.0]
  def up
    create_table :microposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end

  def down
    drop_table :microposts
  end
end
