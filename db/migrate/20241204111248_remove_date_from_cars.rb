class RemoveDateFromCars < ActiveRecord::Migration[7.1]
  def change
    remove_column :cars, :date, :date
  end
end
