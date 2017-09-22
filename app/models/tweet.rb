class Tweet < ApplicationRecord

	belongs_to :user
	has_many :replies, dependent: :destroy
  has_many :likes, dependent: :destroy

end