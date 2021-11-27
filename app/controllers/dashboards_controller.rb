class DashboardsController < ApplicationController
  def show
    @game = current_user.games
                        .where("date > ?", Time.now)
                        .order("date ASC").first
    @other_player = @game.users.where.not(id: current_user.id).first
    @bet = @game.bets.find_by(user: current_user)
    @games = current_user.games
  end
end
