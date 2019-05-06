# frozen_string_literal: true

# Product model with its respective validations.
class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :user

  has_one_attached :image

  include AASM

  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :quantity, presence: true
  validates :price, presence: true

  aasm :column => 'status' do
    state :unpublished, initial: true
    state :published
    state :archived

    event :publish do
      transitions from: [:unpublished, :archived], to: :published
    end

    event :unpublished do
      transitions from: :published, to: :unpublished
    end

    event :archive do
      transitions from: [:published, :published], to: :archived
    end
  end
end
