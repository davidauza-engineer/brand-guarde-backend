class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true,
                   length: { minimum: 1, maximum: 255 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    length: { minimum: 5, maximum: 255 },
                    presence: true,
                    uniqueness: true

  has_many :reviews, dependent: :destroy

  has_one_attached :profile_picture
end
