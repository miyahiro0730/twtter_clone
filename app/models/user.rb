class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :favorite_tweets, through: :favorites, source: :tweet

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
