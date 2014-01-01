class User < ActiveRecord::Base

  has_secure_password
  before_save :create_remember_token

  before_save { |user| user.name = user.name.downcase}

  validates :name, :presence => true

  VALID_EMAIL = /\A[\w+\- .]+@[\w+-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL },
            :uniqueness => { :case_sensitive => false }

  validates :password, :presence => true, :length => { :minimum => 6}

  validates :password_confirmation, :presence => true


private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
