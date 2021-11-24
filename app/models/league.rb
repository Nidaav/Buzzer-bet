class League < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :conference, presence: true
  validates :password, presence: true, uniqueness: true
  validates :number_of_player, presence: true

  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user
  has_many :games, dependent: :destroy

end
