class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :single_watering_amount
      t.float :min_air_humidity
      t.float :max_air_humidity
      t.float :min_soil_moisture
      t.float :max_soil_moisture
      t.float :min_temperature
      t.float :max_temperature
      t.float :max_insolation
      t.float :min_water_amount

      t.timestamps
    end
  end
end
