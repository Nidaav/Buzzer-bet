module GameHelper
  def is_last_date(date)
    last_game = current_user.games.where("date <= ?", Time.now).order("date DESC").first

    last_game.date.to_date == date
  end

  def calculate_gap_points(player_gap, game_gap)
    if (player_gap - game_gap).abs == 0
      return '+15'
    elsif (player_gap - game_gap).abs <= 5
      return '+10'
    elsif (player_gap - game_gap).abs <= 10
      return '+5'
    else
    end
  end

  def calculate_total_points(player_total, game_total)
    if (player_total - game_total).abs == 0
      return '+50'
    elsif (player_total - game_total).abs <= 10
      return '+15'
    elsif (player_total - game_total).abs <= 20
      return '+10'
    elsif (player_total - game_total).abs <= 30
      return '+5'
    else
    end
  end
end
