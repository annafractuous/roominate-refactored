class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.string :gender
      t.string :city
      t.integer :max_rent
      t.string :desired_gender
      t.integer :desired_max_age
      t.integer :desired_min_age
      t.date :move_in

      t.timestamps null: false
    end
  end
end
