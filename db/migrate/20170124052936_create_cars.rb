class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :age_in_km
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
