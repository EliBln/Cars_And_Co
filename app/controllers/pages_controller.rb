class PagesController < ApplicationController
  def home
    @car = Car.new
  end

  def payment
    @cars = Car.all
    @car = Car.find_by(id: params[:car_id])
    if @car.nil?
      redirect_to cars_path, alert: "La voiture demandée est introuvable."
    else
      @rent = @car.rents.last
    end
  end

  def validate_payment
    @car = Car.find_by(id: params[:car_id])

    if @car.nil?
      flash[:alert] = "La voiture demandée est introuvable."
      redirect_to cars_path
    elsif @car.update(payment: true)
      flash[:notice] = "Le paiement a été validé avec succès."
      redirect_to @car
    else
      flash[:alert] = "Une erreur est survenue. Veuillez réessayer."
      redirect_to payment_car_path(@car)
    end
  end

  def profil
    @car = current_user.cars.where(user_id: current_user.id)
    @rents = Rent.where(user_id: current_user.id)
  end
end
