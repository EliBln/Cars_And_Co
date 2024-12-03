class CreateRents < ActiveRecord::Migration[7.1]
  def change
    create_table :rents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.boolean :status
      t.boolean :payment
      t.date :date

      t.timestamps
    end
  end
end
