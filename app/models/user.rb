# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :team_users, dependent: :destroy
  has_many :team_messages, dependent: :destroy
  has_many :teams, through: :team_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true

  enum gender: { man: 0, woman: 1 }

  scope :name_like, -> (name) { where("users.name like ?", "%#{sanitize_sql_like(name)}%") }
end
