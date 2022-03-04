class CreateLikes < ActiveRecord::Migration[6.0]
  def up
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :micropost, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :likes
  end
end
