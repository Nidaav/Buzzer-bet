class DashboardsController < ApplicationController
  def show
    @game = current_user.games
                        .where("date > ?", Time.now)
                        .order("date ASC").first
    @other_player = @game.users.where.not(id: current_user.id).first
  end
end
