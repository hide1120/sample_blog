class Upload < ApplicationRecord
  # 画像アップロード
  mount_uploader :image, ImgUploader
end
