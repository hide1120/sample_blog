class Post < ApplicationRecord
  validates :title, :body, :img, presence: true

  mount_uploader :img, ImgUploader
end
