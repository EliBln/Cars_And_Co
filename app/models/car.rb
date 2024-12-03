class Car < ApplicationRecord
 belongs_to :user

 validates :name, presence: true
 validates :price, presence: true, numericality: { greater_than: 0 }
 validates :car_type, presence: true
 validates :detail, presence: true
 validates :brand, presence: true
 validates :motorization, presence: true
 validates :img_url, presence: true

end
