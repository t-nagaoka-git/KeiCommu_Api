class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  has_many :team_messages, dependent: :destroy
  has_many :users, through: :team_users

  enum visibility_setting: { close: 0, open: 1 }, _prefix: true
  enum gender_restriction: { none: 0, man: 1, woman: 1 }, _prefix: true
end
