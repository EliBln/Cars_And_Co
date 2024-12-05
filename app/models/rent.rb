class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :car_id, presence: true
  validates :user_id, presence: true
end
