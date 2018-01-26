class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name

  has_many :products

  validates :name, presence: true
end
