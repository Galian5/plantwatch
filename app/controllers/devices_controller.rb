class DevicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      redirect_to @device
    else
      render 'new'
    end
  end

  def update
    @device = Device.find(params[:id])
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    redirect_to devices_path
  end

  private

  def device_params
    params.require(:device).permit(:name, :user_id)
  end
end
