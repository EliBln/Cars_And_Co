class RentsController < ApplicationController
  def index
    if user_signed_in?
      @rents = current_user.rents
    else
      @rents = Rent.all
    end
  end

  def new
    @rent = Rent.new
  end

  def create
    @car = Car.find(params[:car_id])
    @rent = Rent.new(rent_params)
    @rent.car = @car
    @rent.user = current_user
    if @rent.save
      redirect_to rents_path
    else
      render "cars/show", status: :unprocessable_entity
    end

    def update
      @rent = Rent.find(params[:id])
      @rent.update(rent_params)
      redirect_to rents_path
    end

    def destroy
      @rent = Rent.find(params[:id])
      @rent.destroy
      redirect_to rents_path
    end

    private

    def rent_params
      params.require(:rent).permit(:payment)
    end
  end
end
