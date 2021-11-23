class League < ApplicationRecord
  belongs_to :user
  has_many :memberships
  has_many :games

  validates :name, presence: true
  validates :conference, presence: true
  validates :password, presence: true, uniqueness: true
  validates :number_of_player, presence: true
end
