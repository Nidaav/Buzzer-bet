module RankingHelper
  def compute_last_games_results(user)
    games = user.games.where("date < ?", Time.now).order("date DESC").first(5)

    content_tag :div do
      games.each do |game|
        user_bet = game.bets.find_by(user: user)
        other_user_bet = game.bets.where.not(user: user).first
        unless game.top_scorer.nil?
          if user_bet.end_result > other_user_bet.end_result
            return content_tag(:div, "", class: "green-bullet bullets")
          elsif user_bet.end_result == other_user_bet.end_result
            return content_tag(:div, "", class: "gray-bullet bullets")
          else
            return content_tag(:div, "", class: "red-bullet bullets")
          end
        end
      end
    end
  end
end
