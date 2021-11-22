class Game < ApplicationRecord
  belongs_to :league
  has_many :bets
end
