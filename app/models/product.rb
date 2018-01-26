class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name
  
  belongs_to :category, counter_cache: true

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
