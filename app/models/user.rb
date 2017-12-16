class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_secure_password
end
