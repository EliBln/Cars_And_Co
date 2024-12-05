class AddDefaultToPaymentInRents < ActiveRecord::Migration[7.1]
  def change
    change_column_default :rents, :payment, false
  end
end
