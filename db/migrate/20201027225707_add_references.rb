class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :devices, :user, foreign_key: true
    add_reference :plants, :device, foreign_key: true
    add_reference :schedules, :plant, foreign_key: true
    add_reference :settings, :plant, foreign_key: true
    add_reference :measurements, :plant, foreign_key: true
  end
end
