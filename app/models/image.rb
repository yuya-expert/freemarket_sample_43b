class Image < ApplicationRecord
  belongs_to :product
  mount_uploader :image, ImageUploader
  belongs_to :product
end
