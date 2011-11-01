class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  def self.encrypt(pass, salt)
    Digest::SHA2.hexdigest(salt+pass)
  end

  def encrypt_password
    return if password.blank?
    if new_record?
      self.salt = ActiveSupport::SecureRandom.base64(8)
    end
    self.encrypted_password = User.encrypt(password, salt)
  end
end
