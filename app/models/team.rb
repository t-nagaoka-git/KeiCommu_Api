class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  has_many :team_messages, dependent: :destroy
end
