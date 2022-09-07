require 'rails_helper'

RSpec.describe "Plants", type: :request do
  let(:user) { create(:user)}
  let(:device) {create(:device)}
  let(:valid_attributes) {
    {
      name: 'ExamplePlant',
      user_id: user.id,
      device_id: device.id
    }
  }
  let(:invalid_attributes) {
    {
      name: nil,
      user: 'foobar'
    }
  }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      Plant.create! valid_attributes
      get plants_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      plant = Plant.create! valid_attributes
      get plant_url(plant)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_plant_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:current_user) { user }
      it "creates a new Plant" do
        expect {
          post plants_url, params: { plant: valid_attributes }
        }.to change(Plant, :count).by(1)
      end

      it "redirects to the created plant" do
        post plants_url, params: { plant: valid_attributes }
        expect(response).to redirect_to(plant_url(Plant.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Plant" do
        expect {
          post plants_url, params: { plant: invalid_attributes }
        }.to change(Plant, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post plants_url, params: { plant: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'ModifiedPlantName' }
      }

      it "updates the requested plant" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: new_attributes }
        plant.reload
        expect(plant.name).to eq("ModifiedPlantName")
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested plant" do
      plant = Plant.create! valid_attributes
      expect {
        delete plant_url(plant)
      }.to change(Plant, :count).by(-1)
    end

    it "redirects to the plants list" do
      plant = Plant.create! valid_attributes
      delete plant_url(plant)
      expect(response).to redirect_to(plants_url)
    end
  end
end
