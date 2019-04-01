class User < ApplicationRecord
  validates :fist_name, presence: true, length: { minimum: 2, maximum: 25 } 
  validates :last_name, presence: true, length: { minimum: 2, maximum: 25 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  before_save {self.email = email.downcase}
end
