class Post < ApplicationRecord
  validates :title, :body, :img, :urls, presence: true

  mount_uploader :img, ImgUploader
end
