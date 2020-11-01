class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.float :air_humidity
      t.float :soil_moisture
      t.float :temperature
      t.float :insolation
      t.float :water_amount

      t.timestamps
    end
  end
end
