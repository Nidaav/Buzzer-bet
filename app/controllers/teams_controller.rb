class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    Team.find_by(acronym: "atl").color = "linear-gradient(188.05deg, rgba(215, 3, 44, 0) 17.76%, #DC2C34 94.63%);"
  end
end
