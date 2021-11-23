class LeaguesController < ApplicationController
  before_action :set_league, only: [:show]

  def show
  end

  def new
    @league = League.new
  end

  def create
    @league = League.create(leagues_params)
    @league.user = current_user
    if @league.save!
      redirect_to(league_path(@league))
    else
      render :new
    end
  end

  private

  def set_league
    @league = League.find(params[:id])
  end

  def leagues_params
    params.require(:league).permit(:name, :conference, :number_of_player)
  end
end
