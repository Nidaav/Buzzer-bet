class GamesController < ApplicationController
  def index
    @games = current_user.games.all.order("date ASC")
  end

  def show
    @game = Game.find(params[:id])
  end
end
