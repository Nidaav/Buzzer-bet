class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :leagues, dependent: :destroy
  has_many :bets
  has_many :games, through: :bets
  has_many :memberships, dependent: :destroy
  has_many :member_leagues, through: :memberships, source: :league, dependent: :destroy
  has_one_attached :photo

  def next_bet
    next_game = self.games
                  .where("date > ?", Time.now)
                  .order("date ASC").first
    return next_game.bets.find_by(user: self)
  end

  def rank
    membership = self.memberships.first
    memberships = self.member_leagues.first.memberships.order("total_points DESC")
    memberships.find_index(membership) + 1
  end

  def won!
    membership = self.memberships.first
    membership.total_points += 3
    membership.save
  end

  def draw!
    membership = self.memberships.first
    membership.total_points += 1
    membership.save
  end

  def stats
    win = 0
    draw = 0
    lose = 0

    # pour chaque match passé du user,
    # checker le end_result par rapport au end_result de l'adversaire
    games = self.bets.where.not(end_result: nil).map(&:game)
    games.each do |game|
      if game.bets.find_by(user: self).end_result > game.bets.where.not(user: self).first.end_result
        win += 1
      elsif game.bets.find_by(user: self).end_result == game.bets.where.not(user: self).first.end_result
        draw += 1
      else
        lose += 1
      end
    end

    return "#{win}W #{draw}D #{lose}L"
  end
end
