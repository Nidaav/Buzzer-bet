class LeaguesController < ApplicationController

  def show
    @league = League.find(params[:id])
    @rank = 0
    @owner = @league.user
    @memberships = @league.memberships.order(total_points: :desc)
  end

  def new
    @league = League.new
  end

  def create
    @league = League.create(leagues_params)
    @league.user = current_user
    @league.password = SecureRandom.alphanumeric(10)
    if @league.save
      redirect_to(league_path(@league))
    else
      render :new
    end
  end

  private

  def leagues_params
    params.require(:league).permit(:name, :conference, :number_of_player)
  end
end
