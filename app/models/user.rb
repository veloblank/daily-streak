class User < ActiveRecord::Base
  has_many :lists
  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_secure_password
end
