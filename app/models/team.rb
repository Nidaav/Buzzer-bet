class Team < ApplicationRecord
  validates :name, presence: true
  validates :color, presence: true
  validates :star_player_img, presence: true
end
