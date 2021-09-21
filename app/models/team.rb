class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
end
