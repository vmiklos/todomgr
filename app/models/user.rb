class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_length_of :username, :within => 4..20
  validates_confirmation_of :password, :if => :password_required?

  has_many :todos

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

  def self.authenticate(username, password)
    user = find_by_username username
    user && user.authenticated?(password) ? user : nil
  end

  def authenticated?(pass)
    encrypted_password == User.encrypt(pass, salt)
  end

  def password_required?
    encrypted_password.blank? || !password.blank?
  end

  def get_todo_page(page)
    todos.order("deadline DESC").paginate(:page => page, :per_page => 5)
  end
end
