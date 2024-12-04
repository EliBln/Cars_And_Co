class ChangeStartDateAndEndDateInCars < ActiveRecord::Migration[7.1]
  def change
    change_column :cars, :start_date, :datetime
    change_column :cars, :end_date, :datetime
  end
end
