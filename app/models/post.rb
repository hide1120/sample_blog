class Post < ApplicationRecord
  # 乱数生成
  generate_public_uid  generator: PublicUid::Generators::HexStringSecureRandom.new(20)

  # 共通
  validates :title, :body, :urls, presence: true

  # 画像アップロード
  mount_uploader :img, ImgUploader

  def to_param
    public_uid
  end
end
