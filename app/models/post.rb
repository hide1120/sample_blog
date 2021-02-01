class Post < ApplicationRecord
  # 共通
  validates :title, :body, :img, :urls, presence: true

  # タイトル
  mount_uploader :img, ImgUploader
end
