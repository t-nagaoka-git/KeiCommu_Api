class TeamMessage < ApplicationRecord
  belongs_to :team
  belongs_to :user

  mount_uploader :image, ImageUploader
end
