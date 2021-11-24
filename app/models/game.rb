class Game < ApplicationRecord
  belongs_to :league
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"

  has_many :bets
  has_many :users, through: :bets
end
