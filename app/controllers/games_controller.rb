class GamesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @games = @league.games.includes(:bets).where.not(bets: { id: nil })

    @games = @games.group_by { |game| game.date.strftime("%d-%m-%Y") }
  end

  def show
    @game = Game.find(params[:id])
  end
end
