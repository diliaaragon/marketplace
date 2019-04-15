# frozen_string_literal: true

# Product model with its respective validations.
class Product < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :quantity, presence: true
  validates :price, presence: true
end