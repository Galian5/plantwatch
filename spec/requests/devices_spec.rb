require 'rails_helper'

RSpec.describe "Devices", type: :request do
  let(:user) { create(:user)}
  let(:valid_attributes) {
    {
      name: 'ExampleDevice',
      user: user
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
      Device.create! valid_attributes
      get devices_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      device = Device.create! valid_attributes
      get device_url(device)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_device_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Device" do
        expect {
          post devices_url, params: { device: valid_attributes }
        }.to change(Device, :count).by(1)
      end

      it "redirects to the created device" do
        post devices_url, params: { device: valid_attributes }
        expect(response).to redirect_to(device_url(Device.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Device" do
        expect {
          post devices_url, params: { device: invalid_attributes }
        }.to change(Device, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post devices_url, params: { device: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'ModifiedDeviceName' }
      }

      it "updates the requested device" do
        device = Device.create! valid_attributes
        patch device_url(device), params: { device: new_attributes }
        device.reload
        expect(device.name).to eq("ModifiedDeviceName")
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        device = Device.create! valid_attributes
        patch device_url(device), params: { device: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested device" do
      device = Device.create! valid_attributes
      expect {
        delete device_url(device)
      }.to change(Device, :count).by(-1)
    end

    it "redirects to the devices list" do
      device = Device.create! valid_attributes
      delete device_url(device)
      expect(response).to redirect_to(devices_url)
    end
  end
end
