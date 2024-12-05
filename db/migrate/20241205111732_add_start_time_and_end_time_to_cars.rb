class AddStartTimeAndEndTimeToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :start_time, :time
    add_column :cars, :end_time, :time
  end
end
