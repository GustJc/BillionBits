class User < ActiveRecord::Base
  has_one :profile
  
  attr_accessor :password
  attr_accessible :email, :username,
                  :password, :password_confirmation
  accepts_nested_attributes_for :profile
  attr_accessible :profile_attributes

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false },
                    length: { within: 5..50 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :username, uniqueness: { case_sensitive: false },
                    length: { within: 4..20 }

  validates :password, confirmation: true,
                       length: { within: 4..50 },
                       presence: true,
                       if: :password_required?



  before_save :encrypt_new_password


  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  protected

  def encrypt_new_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def password_required?
    hashed_password.blank? || password.present?
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end

end
