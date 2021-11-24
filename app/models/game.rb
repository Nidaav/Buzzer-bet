class Game < ApplicationRecord
  belongs_to :league
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"

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

  has_many :users, through: :bets

end
