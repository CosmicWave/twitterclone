class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :tweets, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :replies, dependent: :destroy


        
  has_many :followings, :class_name => 'Followings', :foreign_key => 'follower_id'
  has_many :followings, :class_name => 'Followings', :foreign_key => 'followed_id'

  mount_uploader :image, ImageUploader
end
