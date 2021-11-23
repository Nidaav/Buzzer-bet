class Player < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  has_one_attached :photo
end
