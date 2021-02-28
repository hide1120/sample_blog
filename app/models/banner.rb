class Banner < ApplicationRecord
  validates :title, :img, presence: true

  # 画像アップロード
  mount_uploader :img, ImgUploader
end
