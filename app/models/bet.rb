class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def compute_end_result
    self.end_result = 0
    self.end_result += 5 if top_scorer == game.top_scorer
    self.end_result += 5 if top_rebounder == game.top_rebounder
    self.end_result += 5 if top_passer == game.top_passer
    self.end_result += 5 if winner == game.winner
    self.end_result += 5 if gap_points == game.gap_points
    self.end_result += 5 if total_points == game.total_points

    return self.end_result
  end
end
