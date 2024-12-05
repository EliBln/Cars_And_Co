class RemoveStatusFromRents < ActiveRecord::Migration[7.1]
  def change
    remove_column :rents, :status, :boolean
  end
end
