class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :likes
  has_many :replies
  has_many :notifications

  has_many :active_followings, class_name:  "Following",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_followings, class_name:  "Following",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_followings, source: :followed
  has_many :followers, through: :passive_followings, source: :follower

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end                                  

end
