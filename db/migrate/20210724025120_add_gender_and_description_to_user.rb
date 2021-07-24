class AddGenderAndDescriptionToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :gender, :integer, null: false, default: 0
    add_column :users, :description, :string, null: false, default: ''
  end

  def down
    remove_column :users, :gender
    remove_column :users, :description
  end
end