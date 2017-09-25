class Reply < ApplicationRecord

	belongs_to :tweet
	belongs_to :user


	mount_uploader :image, ImageUploader
end