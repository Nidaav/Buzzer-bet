require 'open-uri'

print "Cleaning DB... "
Player.destroy_all
Game.destroy_all
Team.destroy_all
League.destroy_all
User.destroy_all
Membership.destroy_all
puts "Done!"

url = 'https://nba-players.herokuapp.com/teams'
teams_serialized = URI.open(url).read
teams = JSON.parse(teams_serialized)

team_players = teams.map do |team|
  url = "https://nba-players.herokuapp.com/players-stats-teams/#{team}"
  team_serialized = URI.open(url).read
  JSON.parse(team_serialized)
end

puts "Generating NBA teams and players... "
team_players.each do |players|
  print "Generating #{players.first["team_name"]} team... "
  team = Team.create!(
    name: players.first["team_name"],
    acronym: players.first["team_acronym"]
  )
  puts "Done !"

  print "Generating #{players.first["team_name"]} players... "
  players.each do |player|
    print "."
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
  puts "Done !"
end

url = 'https://data.nba.net/data/10s/prod/v1/2021/teams.json'
teams_serialized = URI.open(url).read
teams = JSON.parse(teams_serialized)["league"]["standard"]

print "Updating teams data..."
teams.each do |team_data|
  team = Team.find_by(acronym: team_data["tricode"].downcase)
  if team
    team.conference = team_data["confName"]
    team.api_team_id = team_data["teamId"]
    team.save
  end
end
puts "Done !"

print "Generating users..."
val = User.new(
  first_name: "Valentin",
  last_name: "Busnel",
  username: "Val35",
  email: "valentin@example.com",
  password: "azerty"
)

yann = User.new(
  first_name: "Yann",
  last_name: "Lochkareff",
  username: "Yaniloubilou",
  email: "yann@example.com",
  password: "azerty"
)

leo = User.new(
  first_name: "Leo",
  last_name: "Tanguy",
  username: "LeoZoo",
  email: "leo@example.com",
  password: "azerty"
)

stan = User.new(
  first_name: "Stan",
  last_name: "Barrage",
  username: "Staniloubilou",
  email: "stan@example.com",
  password: "azerty"
)

paula = User.new(
  first_name: "Paula",
  last_name: "Pao",
  username: "Pao",
  email: "paula@example.com",
  password: "azerty"
)

hugo = User.new(
  first_name: "Hugo",
  last_name: "Roger",
  username: "hugzer",
  email: "hugo@example.com",
  password: "azerty"
)

jeanju = User.new(
  first_name: "Jean-Julien",
  last_name: "Dupont",
  username: "Le J",
  email: "jean-ju@example.com",
  password: "azerty"
)

antoine = User.new(
  first_name: "Antoine",
  last_name: "Daniel",
  username: "Antoine",
  email: "antoine@example.com",
  password: "azerty"
)

louis = User.new(
  first_name: "Louis",
  last_name: "p'tit",
  username: "Louis",
  email: "louis@example.com",
  password: "azerty"
)

jb = User.new(
  first_name: "Jean-baptiste",
  last_name: "Daniel",
  username: "JB",
  email: "jb@example.com",
  password: "azerty"
)

file = File.open("#{Rails.root}/db/fixtures/images/User1.jpg")
val.photo.attach(io: file, filename: "user1.jpg", content_type: 'image/png')
val.save!

file = File.open("#{Rails.root}/db/fixtures/images/yann.jpg")
yann.photo.attach(io: file, filename: "yann.jpg", content_type: 'image/png')
yann.save!

file = File.open("#{Rails.root}/db/fixtures/images/leo.jpg")
leo.photo.attach(io: file, filename: "leo.jpg", content_type: 'image/png')
leo.save!

file = File.open("#{Rails.root}/db/fixtures/images/stan.jpg")
stan.photo.attach(io: file, filename: "stan.jpg", content_type: 'image/png')
stan.save!

file = File.open("#{Rails.root}/db/fixtures/images/paula.jpg")
paula.photo.attach(io: file, filename: "paula.jpg", content_type: 'image/png')
paula.save!

file = File.open("#{Rails.root}/db/fixtures/images/hugo.jpg")
hugo.photo.attach(io: file, filename: "hugo.jpg", content_type: 'image/png')
hugo.save!

file = File.open("#{Rails.root}/db/fixtures/images/jj.jpg")
jeanju.photo.attach(io: file, filename: "jj.jpg", content_type: 'image/png')
jeanju.save!

file = File.open("#{Rails.root}/db/fixtures/images/antoine.jpg")
antoine.photo.attach(io: file, filename: "antoine.jpg", content_type: 'image/png')
antoine.save!

file = File.open("#{Rails.root}/db/fixtures/images/louis.jpg")
louis.photo.attach(io: file, filename: "louis.jpg", content_type: 'image/png')
louis.save!

file = File.open("#{Rails.root}/db/fixtures/images/jb.jpg")
jb.photo.attach(io: file, filename: "jb.jpg", content_type: 'image/png')
jb.save!

puts "Done !"

print "Generating leagues and memberships..."
le_wagon = League.new(
  name: "Le Wagon",
  password: SecureRandom.alphanumeric(10),
  conference: "West",
  number_of_player: 10,
  user: val
)
le_wagon.save!

val_membre = Membership.new(
  user: val,
  league: le_wagon,
  total_points: 35
)

yann_membre = Membership.new(
  user: yann,
  league: le_wagon,
  total_points: 35
)

leo_membre = Membership.new(
  user: leo,
  league: le_wagon,
  total_points: 12
)

stan_membre = Membership.new(
  user: stan,
  league: le_wagon,
  total_points: 23
)

paula_membre = Membership.new(
  user: paula,
  league: le_wagon,
  total_points: 23
)

hugo_membre = Membership.new(
  user: hugo,
  league: le_wagon,
  total_points: 12
)

jeanju_membre = Membership.new(
  user: jeanju,
  league: le_wagon,
  total_points: 9
)

antoine_membre = Membership.new(
  user: antoine,
  league: le_wagon,
  total_points: 10
)

louis_membre = Membership.new(
  user: louis,
  league: le_wagon,
  total_points: 7
)

jb_membre = Membership.new(
  user: jb,
  league: le_wagon,
  total_points: 17
)

val_membre.save!
yann_membre.save!
leo_membre.save!
stan_membre.save!
paula_membre.save!
hugo_membre.save!
jeanju_membre.save!
antoine_membre.save!
louis_membre.save!
jb_membre.save!

puts "Done !"

def scorrer(boxscore)
  return nil unless boxscore["stats"]
  if boxscore["stats"]["hTeam"]["leaders"]["points"]["value"].to_i > boxscore["stats"]["vTeam"]["leaders"]["points"]["value"].to_i
    first_name = boxscore["stats"]["hTeam"]["leaders"]["points"]["players"][0]["firstName"]
    last_name = boxscore["stats"]["hTeam"]["leaders"]["points"]["players"][0]["lastName"]
  else
    first_name = boxscore["stats"]["vTeam"]["leaders"]["points"]["players"][0]["firstName"]
    last_name = boxscore["stats"]["vTeam"]["leaders"]["points"]["players"][0]["lastName"]
  end
  return "#{first_name} #{last_name}"
end

def rebunder(boxscore)
  return nil unless boxscore["stats"]
  if boxscore["stats"]["hTeam"]["leaders"]["rebounds"]["value"].to_i > boxscore["stats"]["vTeam"]["leaders"]["rebounds"]["value"].to_i
    firstName = boxscore["stats"]["hTeam"]["leaders"]["rebounds"]["players"][0]["firstName"]
    lastName = boxscore["stats"]["hTeam"]["leaders"]["rebounds"]["players"][0]["lastName"]
  else
    firstName = boxscore["stats"]["vTeam"]["leaders"]["rebounds"]["players"][0]["firstName"]
    lastName = boxscore["stats"]["vTeam"]["leaders"]["rebounds"]["players"][0]["lastName"]
  end
  return "#{firstName} #{lastName}"
end

def assists(boxscore)
  return nil unless boxscore["stats"]
  if boxscore["stats"]["hTeam"]["leaders"]["assists"]["value"].to_i > boxscore["stats"]["vTeam"]["leaders"]["assists"]["value"].to_i
    firstName = boxscore["stats"]["hTeam"]["leaders"]["assists"]["players"][0]["firstName"]
    lastName = boxscore["stats"]["hTeam"]["leaders"]["assists"]["players"][0]["lastName"]
  else
    firstName = boxscore["stats"]["vTeam"]["leaders"]["assists"]["players"][0]["firstName"]
    lastName = boxscore["stats"]["vTeam"]["leaders"]["assists"]["players"][0]["lastName"]
  end
  return "#{firstName} #{lastName}"
end

url = "https://data.nba.net/data/10s/prod/v1/2021/schedule.json"
games_serialized = URI.open(url).read
games = JSON.parse(games_serialized)["league"]["standard"]

print "Generating games "
games.each do |game_data|
  game_date = Date.parse(game_data["startTimeUTC"])
  next unless game_date == Date.new(2021, 11, 23) || game_date == Date.new(2021, 12, 3)

  print "."
  date = Time.parse(game_data["startTimeUTC"]).localtime("+01:00")

  api_game_id = game_data["gameId"]
  api_start_date = game_data["startDateEastern"]

  url = "https://data.nba.net/data/10s/prod/v1/#{api_start_date}/#{api_game_id}_boxscore.json"
  boxscore_serialized = URI.open(url).read
  boxscore = JSON.parse(boxscore_serialized)

  home_team_api_id = boxscore["basicGameData"]["hTeam"]["teamId"]
  visitor_team_api_id = boxscore["basicGameData"]["vTeam"]["teamId"]

  home_team = Team.find_by(api_team_id: home_team_api_id)
  visitor_team = Team.find_by(api_team_id: visitor_team_api_id)

  next unless home_team && visitor_team

  home_team_score = boxscore["basicGameData"]["hTeam"]["score"].to_i
  visitor_team_score = boxscore["basicGameData"]["vTeam"]["score"].to_i

  total_score = home_team_score + visitor_team_score
  gap_score = home_team_score - visitor_team_score

  jb_vs_louis = Game.new(
    date: date,
    winner: gap_score.positive? ? home_team.name : visitor_team.name,
    top_scorer: scorrer(boxscore),
    total_points: total_score,
    top_rebounder: rebunder(boxscore),
    top_passer: assists(boxscore),
    gap_points: gap_score.abs,
    league: le_wagon,
    team1: home_team,
    team2: visitor_team
  )

  jb_vs_louis.save!
end
puts "Done !"
