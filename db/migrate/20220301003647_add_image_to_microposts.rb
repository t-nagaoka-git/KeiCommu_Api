class AddImageToMicroposts < ActiveRecord::Migration[6.0]
  def up
    add_column :microposts, :image, :string
  end

  def down
    remove_column :microposts, :image
  end
end
