class Country < ApplicationRecord
  validates :name, presence: true,
            length: { minimum: 1, maximum: 255 },
            uniqueness: true
  
  has_many :restaurants
end
