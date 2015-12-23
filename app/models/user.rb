require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_new_password
  validates :email, uniqueness: {case_sensitive: false}, length: {in: 6..20}, format: {with: /\A(\S+)@(.+)\.(\S+)\z/, message: "Formato de correo no válido"}
  validates :password, confirmation: true, length: {within: 4..20}, presence: {if: :password_required?}
  validates :password_confirmation, presence: true

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
