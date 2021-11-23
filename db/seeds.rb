require 'open-uri'

Player.destroy_all
Team.destroy_all

url = 'https://nba-players.herokuapp.com/teams'
teams_serialized = URI.open(url).read
teams = JSON.parse(teams_serialized)

team_players = teams.map do |team|
  url = "https://nba-players.herokuapp.com/players-stats-teams/#{team}"
  team_serialized = URI.open(url).read
  JSON.parse(team_serialized)
end

team_players.each do |players|
  team = Team.create!(
    name: players.first["team_name"],
    acronym: players.first["team_acronym"]
  )

  players.each do |player|
    splitted_name = player["name"].split(" ")
    if splitted_name.length == 3
      last_name = "#{splitted_name[1]}_#{splitted_name[2]}".gsub(/(\.|\')/, "")
    else
      last_name = splitted_name[1].gsub(/(\.|\')/, "")
    end
    first_name = player["name"].split(" ")[0].gsub(/(\.|\')/, "")

    Player.create!(
      name: player["name"],
      team: team,
      photo_url: "https://nba-players.herokuapp.com/players/#{last_name}/#{first_name}"
    )
  end
end


url = 'https://data.nba.net/data/10s/prod/v1/2021/teams.json'
teams_serialized = URI.open(url).read
teams = JSON.parse(teams_serialized)["league"]["standard"]

teams.each do |team_data|
  team = Team.find_by(acronym: team_data["tricode"].downcase)
  if team
    team.conference = team_data["confName"]
    team.api_team_id = team_data["teamId"]
    team.save
  end
end
