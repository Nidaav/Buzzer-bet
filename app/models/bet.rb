class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :winner, presence: true
  validates :top_scorer, presence: true
  validates :total_points, presence: true
  validates :top_rebounder, presence: true
  validates :top_passer, presence: true
  validates :man_of_the_match, presence: true
  validates :gap_points, presence: true
  validates :end_result, presence: true
end
