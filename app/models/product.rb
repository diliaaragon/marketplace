# frozen_string_literal: true

# Product model with its respective validations.
class Product < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :quantity, presence: true
  validates :price, presence: true
end
