class NotificationMailerPreview < ActionMailer::Preview
  def notification_email
    @measurement = {
      air_humidity: 50,
      soil_moisture: 35,
      temperature: 20.0,
      insolation: 5000.0,
      water_amount: 500.0,
      created_at: Time.now,
      updated_at: Time.now,
      plant_id: 1}

    NotificationMailer.with(user: User.first, plant: Plant.first, measurement: @measurement).notification_email
  end
end
