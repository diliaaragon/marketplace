class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 2, maximum: 25 } 
  validates :last_name, presence: true, length: { minimum: 2, maximum: 25 } 
  VALID_EMAIL_REGEX = /\A[a-z\d\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
end
