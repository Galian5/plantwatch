require 'rails_helper'

RSpec.describe "Settings", type: :request do
  let(:user) { create(:user)}
  let(:device) { create(:device, user_id: user.id) }
  let(:plant) { create(:plant, device_id: device.id, user_id: user.id) }
  let(:valid_attributes) {
    {
      single_watering_amount: 500,
      min_air_humidity: 20,
      max_air_humidity: 80,
      min_soil_moisture: 10,
      max_soil_moisture:40,
      min_temperature:15,
      max_temperature:25,
      max_insolation: 8,
      min_water_amount: 500,
      plant_id: plant.id
    }
  }
  let(:invalid_attributes) {
    {
      single_watering_amount: "test",
      min_air_humidity: 000,
      max_air_humidity: nil,
      min_soil_moisture: nil,
      max_soil_moisture: "test",
      min_temperature: "test",
      max_temperature: nil,
      max_insolation: nil,
      min_water_amount: "not enough",
      plant_id: plant.id
    }
  }

  before do
    sign_in user
  end

  describe "GET /show" do
    it "renders a successful response" do
      setting = Setting.create! valid_attributes
      get plant_setting_url(plant, setting)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_plant_setting_url(plant)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:current_user) { user }
      it "creates a new Setting" do
        expect {
          post plant_settings_url(plant), params: { setting: valid_attributes }
        }.to change(Setting, :count).by(1)
      end

      it "redirects to the created setting" do
        post plant_settings_url(plant), params: { setting: valid_attributes }
        expect(response).to redirect_to(plants_path(plant))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Setting" do
        expect {
          post plant_settings_url(plant), params: { setting: invalid_attributes }
        }.to change(Setting, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post plant_settings_url(plant), params: { setting: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { single_watering_amount: 770 }
      }

      it "updates the requested setting" do
        setting = Setting.create! valid_attributes
        patch plant_setting_url(plant, setting), params: { setting: new_attributes }
        setting.reload
        expect(setting.single_watering_amount).to eq(770)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        setting = Setting.create! valid_attributes
        patch plant_setting_url(plant, setting), params: { setting: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
