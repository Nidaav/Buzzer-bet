class GamesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @games = @league.games.includes(:bets).where.not(bets: { id: nil }).order("date ASC")

    @games = @games.group_by { |game| game.date.to_date }
  end

  def show
    @game = Game.find(params[:id])
    @league = @game.league
    # @game = current_user.games
    #                     .where("date > ?", Time.now)
    #                     .order("date ASC").first
    @bets = @game.bets

    @other_player = User.first
    @bet_one = @bets.first
    @bet_two = @bets.last
    @bet_one.user.photo

  end
end
