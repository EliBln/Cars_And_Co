class Car < ApplicationRecord
 belongs_to :user
 has_many :rents

 geocoded_by :address
 after_validation :geocode, if: :will_save_change_to_address?

 validates :name, presence: true
 validates :price, presence: true, numericality: { greater_than: 0 }
 validates :car_type, presence: true
 validates :detail, presence: true
 validates :brand, presence: true
 validates :motorization, presence: true
 validates :img_url, presence: true
 validates :address, presence: true

end
