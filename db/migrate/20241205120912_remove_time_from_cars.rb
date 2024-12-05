class RemoveTimeFromCars < ActiveRecord::Migration[7.1]
  def change
    remove_column :cars, :start_time, :integer
    remove_column :cars, :end_time, :integer
  end
end
