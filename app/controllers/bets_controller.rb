class BetsController < ApplicationController
  def edit
    @game = current_user.games
                  .where("date > ?", Time.now)
                  .order("date ASC").first
    @other_player = @game.users.where.not(id: current_user.id).first
    @bet = @game.bets.find_by(user: current_user)
  end

  def update
    @bet = Bet.find(params[:id])

    if @bet.update(bet_params)
      redirect_to dashboard_path, notice: "All good"
    else
      render :edit
    end
  end

  private

  def bet_params
    params.require(:bet).permit(:winner, :top_scorer, :top_rebounder, :top_passer, :total_points, :gap_points)
  end
end
