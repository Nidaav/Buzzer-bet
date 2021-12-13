class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :league


  validates :total_points, presence: true
end
