# frozen_string_literal: true

# User model with its relation to affair and validations.
class User < ApplicationRecord
  has_many :products

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :photo, presence: true
  validates :first_name, presence: true, length: { minimum: 2, maximum: 25 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[a-z\d\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX }
end