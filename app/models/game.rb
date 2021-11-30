class Game < ApplicationRecord
  belongs_to :league
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"

  has_many :bets

  validates :date, presence: true
  validates :winner, presence: true
  validates :total_points, presence: true
  validates :gap_points, presence: true
  validates :team1_id, presence: true
  validates :team2_id, presence: true

  has_many :users, through: :bets


  def set_user_results
    bet1 = self.bets.first
    bet2 = self.bets.last

    if bet1.end_result > bet2.end_result
      bet1.user.won!
    elsif bet1.end_result == bet2.end_result
      bet1.user.draw!
      bet2.user.draw!
    else
      bet2.user.won!
    end
  end
end
