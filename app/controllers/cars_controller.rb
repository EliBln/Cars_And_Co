class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def search
    @cars = Car.all
    if params[:car][:car_type].present? && params[:car][:brand].present? && params[:car][:motorization].present?
      @cars = @cars.where(car_type: params[:car][:car_type]).where(brand: params[:car][:brand]).where(motorization: params[:car][:motorization])
    elsif params[:car][:car_type].present? && params[:car][:brand].present?
      @cars = @cars.where(car_type: params[:car][:car_type]).where(brand: params[:car][:brand])
    elsif params[:car][:car_type].present? && params[:car][:motorization].present?
      @cars = @cars.where(car_type: params[:car][:car_type]).where(motorization: params[:car][:motorization])
    elsif params[:car][:brand].present? && params[:car][:motorization].present?
      @cars = @cars.where(brand: params[:car][:brand]).where(motorization: params[:car][:motorization])
    elsif params[:car][:car_type].present?
      @cars = @cars.where(car_type: params[:car][:car_type])
    elsif params[:car][:brand].present?
      @cars = @cars.where(brand: params[:car][:brand])
    elsif params[:car][:motorization].present?
      @cars = @cars.where(motorization: params[:car][:motorization])
    end
  end

  def show
    @car = Car.find(params[:id])
    @markers = @car.geocode
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    if @car.save
      redirect_to cars_path, notice: "Voiture crée !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :price, :detail, :img_url, :user_id, :brand, :car_type, :motorization, :address, :start_date, :end_date,)
  end
end
