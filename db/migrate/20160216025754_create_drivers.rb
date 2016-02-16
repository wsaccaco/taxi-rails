class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :driv_plate
      t.string :driv_trademark
      t.string :driv_colour

      t.timestamps null: false
    end
  end
end
