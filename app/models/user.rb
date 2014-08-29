class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :email, :name, :password_confirmation

  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  validates_confirmation_of :password,
                            if: lambda { |m| m.password.present? }
end
