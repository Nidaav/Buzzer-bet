class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def compute_end_result
    self.end_result = 0
    self.end_result += 5 if top_scorer == game.top_scorer
    self.end_result += 5 if top_rebounder == game.top_rebounder
    self.end_result += 5 if top_passer == game.top_passer
    self.end_result += 5 if winner == game.winner

    self.end_result += 5 if (game.gap_points - 10..game.gap_points + 10).include? gap_points
    self.end_result += 10 if (game.gap_points - 5..game.gap_points + 5).include? gap_points
    self.end_result += 15 if gap_points == game.gap_points

    self.end_result += 5 if (game.total_points - 30..game.total_points + 30).include? total_points
    self.end_result += 10 if (game.total_points - 20..game.total_points + 20).include? total_points
    self.end_result += 15 if (game.total_points - 10..game.total_points + 10).include? total_points
    self.end_result += 50 if total_points == game.total_points

    return self.end_result
  end

  validates :winner, presence: true
  validates :total_points, presence: true
  validates :gap_points, presence: true
end
