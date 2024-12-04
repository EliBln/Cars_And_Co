class AddDatesToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :start_date, :date
    add_column :cars, :end_date, :date
  end
end
