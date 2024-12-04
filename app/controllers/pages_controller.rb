class PagesController < ApplicationController
  def home
    @cars = Car.new
  end

  def profil
    @car = current_user.cars.where(user_id: current_user.id)
    @rents = Rent.where(user_id: current_user.id)
  end
end
