# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :team_users, dependent: :destroy
  has_many :team_messages, dependent: :destroy
  has_many :teams, through: :team_users
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :image, ImageUploader

  validates :name, presence: true

  enum gender: { man: 0, woman: 1 }

  scope :name_like, -> (keyword) { where("users.name like ?", "%#{sanitize_sql_like(keyword)}%") }

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
