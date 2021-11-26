class GamesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @games = @league.games.includes(:bets).where.not(bets: { id: nil })

    @games = @games.group_by { |game| game.date.strftime("%d-%m-%Y") }
  end

  def show
    @league = League.find(params[:id])
    @game = current_user.games
                        .where("date > ?", Time.now)
                        .order("date ASC").first
    @other_player = @game.users.where.not(id: current_user.id).first
  end
end
