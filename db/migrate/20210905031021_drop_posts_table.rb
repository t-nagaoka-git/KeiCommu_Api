class DropPostsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :posts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
