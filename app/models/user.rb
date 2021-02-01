class User < ApplicationRecord
  before_save :downcase_email

  # email validates
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  # password validates
  has_secure_password
  validates :password, presence: true, confirmation: true,
                       length: { minimum: 6 }, allow_nil: true

    private
      # メルアドをすべて小文字に変換する
      def downcase_email
        self.email = emial.downcase
      end
end
