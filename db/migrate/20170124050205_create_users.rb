class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :sex
      t.string :address

      t.timestamps null: false
    end
  end
end
