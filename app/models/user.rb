class User < ApplicationRecord
  before_save :downcase_email

  # 共通 validates
  validates :email, :password, presence: true

  # name validates
  validates :name, length: { minimum: 1 }

  # email validates
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  # password validates
  has_secure_password
  validates :password, confirmation: true,
                       length: { minimum: 6 },
                       allow_nil: true

  # userimage
  mount_uploader :userimage, ImgUploader

  private
    # メルアドをすべて小文字に変換する
    def downcase_email
      self.email = email.downcase
    end
end
