# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SettingSet.create(name: 'Monstera', single_watering_amount: 300, min_air_humidity: 40, max_air_humidity: 80, min_soil_moisture:35, max_soil_moisture: 80, min_temperature: 18, max_temperature: 29, max_insolation: 90)
SettingSet.create(name: 'Wężownica', single_watering_amount: 200, min_air_humidity: 35, max_air_humidity: 70, min_soil_moisture:35, max_soil_moisture: 80, min_temperature: 21, max_temperature: 28, max_insolation: 80)
SettingSet.create(name: 'Zamiokulkas', single_watering_amount: 150, min_air_humidity: 35, max_air_humidity: 80, min_soil_moisture:35, max_soil_moisture: 80, min_temperature: 21, max_temperature: 26, max_insolation: 75)
