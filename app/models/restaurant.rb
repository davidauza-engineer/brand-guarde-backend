class Restaurant < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 1, maximum: 255 },
                   uniqueness: true
  validates :address, length: { maximum: 255 }

  has_many :reviews
  belongs_to :chain
  belongs_to :country
end
