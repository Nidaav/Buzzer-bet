module GameHelper
  def is_last_date(date)
    last_game = current_user.games.where("date <= ?", Time.now).order("date DESC").first

    last_game.date.to_date == date
  end
end
