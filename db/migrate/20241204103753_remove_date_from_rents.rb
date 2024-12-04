class RemoveDateFromRents < ActiveRecord::Migration[7.1]
  def change
    remove_column :rents, :date, :date
    add_column :cars, :date, :date
  end
end
