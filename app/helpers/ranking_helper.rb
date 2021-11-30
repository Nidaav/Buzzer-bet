module RankingHelper
  def compute_last_games_results(user)
    games = user.games.where("date < ?", Date.today).order("date DESC").first(5)

    @content = content_tag :div
    games.each do |game|
      user_bet = game.bets.find_by(user: user)
      other_user_bet = game.bets.where.not(user: user).first

      if user_bet.end_result > other_user_bet.end_result
        @content << content_tag(:div, "", class: "green-bullet bullets")
      elsif user_bet.end_result == other_user_bet.end_result
        @content << content_tag(:div, "", class: "gray-bullet bullets")
      else
        @content << content_tag(:div, "", class: "red-bullet bullets")
      end
    end

    return @content
  end
end
