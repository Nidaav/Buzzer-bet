class Game < ApplicationRecord
  belongs_to :league
  has_many :bets

  validates :date, presence: true
  validates :winner, presence: true
  validates :top_scorer, presence: true
  validates :total_points, presence: true
  validates :top_rebounder, presence: true
  validates :top_passer, presence: true
  validates :man_of_the_match, presence: true
  validates :gap_points, presence: true
  validates :team1_id, presence: true
  validates :team2_id, presence: true
end
