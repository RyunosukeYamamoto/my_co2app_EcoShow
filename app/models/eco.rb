class Eco < ApplicationRecord
  validates :action, presence: true, length: { maximum: 255 }
  validates :co2, numericality: { only_integer: true, greater_than: 0, less_than: 5000 }
end
