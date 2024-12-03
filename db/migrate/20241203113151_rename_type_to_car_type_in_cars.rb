class RenameTypeToCarTypeInCars < ActiveRecord::Migration[7.1]
  def change
    rename_column :cars, :type, :car_type
  end
end
