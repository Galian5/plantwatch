require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  let(:user) { create(:user)}
  let(:device) { create(:device, user_id: user.id) }
  let(:plant) { create(:plant, device_id: device.id, user_id: user.id) }
  let(:valid_attributes) {
    {
      watering: true,
      interval: 777,
      plant_id: plant.id
    }
  }
  let(:invalid_attributes) {
    {
      watering: nil,
      interval: 'foobar'
    }
  }

  before do
    sign_in user
  end

  describe "GET /show" do
    it "renders a successful response" do
      schedule = Schedule.create! valid_attributes
      get plant_schedule_url(plant, schedule)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_plant_schedule_url(plant)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:current_user) { user }
      it "creates a new Schedule" do
        expect {
          post plant_schedules_url(plant), params: { schedule: valid_attributes }
        }.to change(Schedule, :count).by(1)
      end

      it "redirects to the created schedule" do
        post plant_schedules_url(plant), params: { schedule: valid_attributes }
        expect(response).to redirect_to(plants_path(plant))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Schedule" do
        expect {
          post plant_schedules_url(plant), params: { schedule: invalid_attributes }
        }.to change(Schedule, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post plant_schedules_url(plant), params: { schedule: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { interval: 24 }
      }

      it "updates the requested schedule" do
        schedule = Schedule.create! valid_attributes
        patch plant_schedule_url(plant, schedule), params: { schedule: new_attributes }
        schedule.reload
        expect(schedule.interval).to eq(24)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        schedule = Schedule.create! valid_attributes
        patch plant_schedule_url(plant, schedule), params: { schedule: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
