class AddCoordinatesToCar < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :latitude, :float
    add_column :cars, :longitude, :float
    add_column :cars, :address, :string
  end
end
