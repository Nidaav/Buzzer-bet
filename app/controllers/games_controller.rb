class GamesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @games = @league.games.includes(:bets).where.not(bets: { id: nil }).order("date ASC")

    @games = @games.group_by { |game| game.date.to_date }
  end

  def show
    @game = Game.find(params[:id])
    @league = @game.league
    @bets = @game.bets

    @bet_one = @bets.first
    @bet_two = @bets.last

    @winner1 = @bet_one.winner
    @winner2 = @bet_two.winner

    @top_scorer1 = @bet_one.top_scorer
    @top_scorer2 = @bet_two.top_scorer

    @top_passer1 = @bet_one.top_passer
    @top_passer2 = @bet_two.top_passer

    @top_rebounder1 = @bet_one.top_rebounder
    @top_rebounder2 = @bet_two.top_rebounder

    @total_pts1 = @bet_one.total_points
    @total_pts2 = @bet_two.total_points

    @gap_pts1 = @bet_one.gap_points
    @gap_pts2 = @bet_two.gap_points
  end
end
