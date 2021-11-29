class Team < ApplicationRecord
  validates :name, presence: true
  has_many :players

  has_one_attached :logo
  has_one_attached :star_player_img
end
