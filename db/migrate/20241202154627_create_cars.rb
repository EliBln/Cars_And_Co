class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :price
      t.text :detail
      t.string :img_url
      t.references :user, null: false, foreign_key: true
      t.string :brand
      t.string :type
      t.string :motorization

      t.timestamps
    end
  end
end
