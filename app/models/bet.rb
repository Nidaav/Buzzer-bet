class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def compute_end_result(bet_two)
    self.end_result = 0
    self.end_result += 5 if top_scorer == game.top_scorer
    self.end_result += 5 if top_rebounder == game.top_rebounder
    self.end_result += 5 if top_passer == game.top_passer
    self.end_result += 5 if winner == game.winner


    five_points_gap = 5
    ten_points_gap = 10
    fifteen_points_gap = 15

    if (self.gap_points - self.game.gap_points).abs < (bet_two.gap_points - self.game.gap_points).abs
      five_points_gap *= 2
      ten_points_gap *= 2
      fifteen_points_gap *= 2
    end

    if gap_points == game.gap_points
      self.end_result += fifteen_points_gap
    elsif (game.gap_points - 5..game.gap_points + 5).include? gap_points
      self.end_result += ten_points_gap
    elsif (game.gap_points - 10..game.gap_points + 10).include? gap_points
      self.end_result += five_points_gap
    end

    five_points = 5
    ten_points = 10
    fifteen_points = 15

    if (self.total_points - self.game.total_points).abs < (bet_two.total_points - self.game.total_points).abs
      five_points *= 2
      ten_points *= 2
      fifteen_points *= 2
    end

    if total_points == game.total_points
      self.end_result += 50
    elsif (game.total_points - 10..game.total_points + 10).include? total_points
      self.end_result += fifteen_points
    elsif (game.total_points - 20..game.total_points + 20).include? total_points
      self.end_result += ten_points
    elsif (game.total_points - 30..game.total_points + 30).include? total_points
      self.end_result += five_points
    end
  end

  validates :winner, presence: true
  validates :total_points, presence: true
  validates :gap_points, presence: true
end
