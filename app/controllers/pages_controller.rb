class PagesController < ApplicationController
  def home
    @car = Car.new
  end

  def payment
    @cars = Car.all
    @car = Car.find_by(id: params[:car_id])
    @rent = Rent.new
    @rent.car = @car
    @rent.user = current_user
    if !@rent.save!
      render "cars/show", status: :unprocessable_entity
    end
  end

  def validate_payment
    @rent = Rent.find_by(id: params[:id])
    @car = Car.find_by(id: @rent.car_id)
    if @rent.payment != true
      @rent.payment = true
      @rent.save!
    end
    # redirect_to root_path
  end

  def confirmation
    @car = Car.find(params[:car_id])
  end

  def profil
    if current_user
      @cars = current_user.cars
      @rents = Rent.where(car_id: @cars.ids)

    else
      redirect_to new_user_session_path, alert: "Vous devez être connecté pour accéder à cette page."
    end
  end
end
