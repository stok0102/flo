class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  validates_presence_of :username
end
