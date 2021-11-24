class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :leagues, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :member_leagues, through: :memberships, source: :league, dependent: :destroy
  has_one_attached :photo
end
