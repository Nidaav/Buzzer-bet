class Team < ApplicationRecord
  validates :name, presence: true
  has_many :players
  has_one_attached :photo
end
