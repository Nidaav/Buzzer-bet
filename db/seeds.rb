require 'open-uri'

print "Cleaning DB... "
Player.destroy_all
Bet.destroy_all
Game.destroy_all
Team.destroy_all
League.destroy_all
Message.destroy_all
User.destroy_all
Membership.destroy_all
puts "Done!"

# url = 'https://nba-players.herokuapp.com/teams'
# teams_serialized = URI.open(url).read
# teams = JSON.parse(teams_serialized)

Chatroom.create(name: "Le wagon")

url = 'https://data.nba.net/data/10s/prod/v1/2021/teams.json'
teams_serialized = URI.open(url).read
teams = JSON.parse(teams_serialized)["league"]["standard"]

print "Updating teams data..."
teams.each do |team_data|
  next if team_data["tricode"] == "UTB" || team_data["tricode"] == "UTW" || team_data["tricode"] == "LBN" || team_data["tricode"] == "DRT"

  team = Team.new(
    acronym: team_data["tricode"].downcase,
    name: team_data["fullName"],
    conference: team_data["confName"],
    api_team_id: team_data["teamId"]
  )

  next unless team

  logo = File.open("#{Rails.root}/db/fixtures/images/#{team.acronym}_logo.svg")
  team.logo.attach(io: logo, filename: "#{team.acronym}_logo.svg", content_type: 'image/png')

  star_player_img = File.open("#{Rails.root}/db/fixtures/images/#{team.acronym}_star.png")
  team.star_player_img.attach(io: star_player_img, filename: "#{team.acronym}_star.png", content_type: 'image/png')

  team.save!
end



Team.find_by(acronym: "atl").update(color: "linear-gradient(#DC2C34, #21212F);")
Team.find_by(acronym: "bos").update(color: "linear-gradient(#008248, #21212F);")
Team.find_by(acronym: "bkn").update(color: "linear-gradient(#000000, #21212F);")
Team.find_by(acronym: "cha").update(color: "linear-gradient(#00788C, #21212F);")
Team.find_by(acronym: "chi").update(color: "linear-gradient(000000, #21212F);")
Team.find_by(acronym: "cle").update(color: "linear-gradient(#6F2633, #21212F);")
Team.find_by(acronym: "dal").update(color: "linear-gradient(#005AA7, #21212F);")
Team.find_by(acronym: "den").update(color: "linear-gradient(#0D2240, #21212F);")
Team.find_by(acronym: "det").update(color: "linear-gradient(#0061C6, #21212F);")
Team.find_by(acronym: "gsw").update(color: "linear-gradient(#234EA5, #21212F);")
Team.find_by(acronym: "hou").update(color: "linear-gradient(#222A35, #21212F);")
Team.find_by(acronym: "ind").update(color: "linear-gradient(#0E2749, #21212F);")
Team.find_by(acronym: "lac").update(color: "linear-gradient(#D7032C, #21212F);")
Team.find_by(acronym: "lal").update(color: "linear-gradient(#712A8C, #21212F);")
Team.find_by(acronym: "mem").update(color: "linear-gradient(#5D76A9, #21212F);")
Team.find_by(acronym: "mia").update(color: "linear-gradient(#222A35, #21212F);")
Team.find_by(acronym: "mil").update(color: "linear-gradient(#005323, #21212F);")
Team.find_by(acronym: "min").update(color: "linear-gradient(#001445, #21212F);")
Team.find_by(acronym: "nop").update(color: "linear-gradient(#002B5C, #21212F);")
Team.find_by(acronym: "nyk").update(color: "linear-gradient(#0E49A0, #21212F);")
Team.find_by(acronym: "okc").update(color: "linear-gradient(#007DC3, #21212F);")
Team.find_by(acronym: "orl").update(color: "linear-gradient(#0069AB, #21212F);")
Team.find_by(acronym: "phi").update(color: "linear-gradient(#023DA4, #21212F);")
Team.find_by(acronym: "phx").update(color: "linear-gradient(#2C2866, #21212F);")
Team.find_by(acronym: "por").update(color: "linear-gradient(#D00A2C, #21212F);")
Team.find_by(acronym: "sac").update(color: "linear-gradient(#5B2B82, #21212F);")
Team.find_by(acronym: "sas").update(color: "linear-gradient(#000000, #21212F);")
Team.find_by(acronym: "tor").update(color: "linear-gradient(#8C8D8C, #21212F);")
Team.find_by(acronym: "uta").update(color: "linear-gradient(#002144, #21212F);")
Team.find_by(acronym: "was").update(color: "linear-gradient(#002A5C, #21212F);")

puts "Done !"

url = "https://data.nba.net/data/10s/prod/v1/2021/players.json"
# url = "https://cdn.nba.com/headshots/nba/latest/1040x760/1628960.png"
team_serialized = URI.open(url).read
players = JSON.parse(team_serialized)["league"]["standard"]

puts "Generating NBA teams and players... "
players.each do |player|
  print "."
  next unless player["teams"].last

  team = Team.find_by(api_team_id: player["teams"].last["teamId"])

  Player.create!(
    name: "#{player['firstName']} #{player['lastName']}",
    team: team,
    # photo_url: "https://nba-players.herokuapp.com/players/#{last_name}/#{first_name}"
    photo_url: "https://cdn.nba.com/headshots/nba/latest/1040x760/#{player['personId']}.png"
  )
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
  username: "Lochka",
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
  username: "Stan",
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
  username: "Hugzer",
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
  total_points: 0
)

yann_membre = Membership.new(
  user: yann,
  league: le_wagon,
  total_points: 0
)

leo_membre = Membership.new(
  user: leo,
  league: le_wagon,
  total_points: 0
)

stan_membre = Membership.new(
  user: stan,
  league: le_wagon,
  total_points: 0
)

paula_membre = Membership.new(
  user: paula,
  league: le_wagon,
  total_points: 0
)

hugo_membre = Membership.new(
  user: hugo,
  league: le_wagon,
  total_points: 0
)

jeanju_membre = Membership.new(
  user: jeanju,
  league: le_wagon,
  total_points: 0
)

antoine_membre = Membership.new(
  user: antoine,
  league: le_wagon,
  total_points: 0
)

louis_membre = Membership.new(
  user: louis,
  league: le_wagon,
  total_points: 0
)

jb_membre = Membership.new(
  user: jb,
  league: le_wagon,
  total_points: 0
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

  next unless game_date > Date.today - 2.weeks && game_date < Date.today + 2.months

  print "."
  date = Time.parse(game_data["startTimeUTC"]).localtime("+02:00")

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

  Game.create!(
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
end
puts "Done !"


print "Generating bets..."

users = User.all.to_a
matchups = (1...users.size).map do |r|
  t = users.dup
  (0...(users.size/2)).map do |_|
    [t.shift, t.delete_at(-((r % t.size) + (r >= t.size * 2 ? 1 : 0)))]
  end
end

matchups += matchups

i = 0
Game.all.group_by { |game| game.date.to_date }.each do |date, games|
  if games.length >= 5 && date > Date.today - 2.weeks && i < 18
    games.each_with_index do |game, index|
      next if index > 4

      bet1 = Bet.new(
        winner: [game.team1.name, game.team2.name].sample,
        top_scorer: [game.top_scorer, game.top_rebounder, game.top_passer].sample,
        total_points: rand((game.total_points - 30)..(game.total_points + 30)),
        top_rebounder: [game.top_scorer, game.top_rebounder, game.top_passer].sample,
        top_passer: [game.top_scorer, game.top_rebounder, game.top_passer].sample,
        gap_points: rand((game.gap_points - 10)..(game.gap_points + 10)),
        game: game,
      )

      bet2 = Bet.new(
        winner: [game.team1.name, game.team2.name].sample,
        top_scorer: [game.top_scorer, game.top_rebounder, game.top_passer].sample,
        total_points: rand((game.total_points - 30)..(game.total_points + 30)),
        top_rebounder: [game.top_scorer, game.top_rebounder, game.top_passer].sample,
        top_passer: [game.top_scorer, game.top_rebounder, game.top_passer].sample,
        gap_points: rand((game.gap_points - 10)..(game.gap_points + 10)),
        game: game,
      )

      if date <= Date.today
        bet1.user = matchups[i][index][0]
        bet1.compute_end_result(bet2)
        bet2.user = matchups[i][index][1]
        bet2.compute_end_result(bet1)
      else
        bet1.user = matchups[i][index][0]
        bet2.user = matchups[i][index][1]
      end

      bet1.save!
      bet2.save!

      game.set_user_results if date <= Date.today
    end
    i += 1
  end
end

puts "done"
