class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    if @car.save
    redirect_to cars_path, notice: 'Voiture crée !'
  else

    render :new, status: :unprocessable_entity
  end
 end

 private

  def car_params
    params.require(:car).permit(:name, :price, :detail, :img_url, :user_id, :brand, :car_type, :motorization, :start_date, :end_date)
  end

end
