class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.boolean :watering
      t.integer :interval

      t.timestamps
    end
  end
end
