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
    @user = current_user
    @device = @user.devices.create(device_params)

    if @device.save
      redirect_to @device
    else
      render 'new'
    end
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])

    if @device.update(device_params)
      redirect_to @device
    else
      render 'edit'
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    redirect_to devices_path
  end

  private

  def device_params
    params.require(:device).permit(:name, :user_id, :uri_address)
  end
end
