class User < ApplicationRecord
  validates_uniqueness_of :email
  validates_presence_of :password_digest
  validates_uniqueness_of :api_key
  has_secure_password

  before_create do 
    self[:api_key] = create_key
  end

  def create_key 
    SecureRandom.hex(13)
  end
end
