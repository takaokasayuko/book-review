class User < ApplicationRecord
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX, allow_blank: true },
                    uniqueness: { case_sensitive: false, allow_blank: true }
  has_secure_password
  validates :password, format: {
                        with: VALID_PASSWORD_REGEX,
                        message: :invalid_password
                      },
                       length: { minimum: 8 },
                       allow_blank: true
end
