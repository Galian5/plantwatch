class SettingSetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @setting_sets = SettingSet.all
  end

  def show
    @setting_set = SettingSet.find(params[:id])
  end

  def new
    @setting_set = SettingSet.new
  end

  def create
    @setting_set = SettingSet.new(setting_sets_params)

    if @setting_set.save
      p setting_sets_params
      redirect_to setting_sets_path
    else
      render 'new'
    end
  end

  def edit
    @setting_set = SettingSet.find(params[:id])
  end

  def update
    @setting_set = SettingSet.find(params[:id])

    if @setting_set.update(setting_sets_params)
      redirect_to @setting_set
    else
      render 'edit'
    end
  end

  def destroy
    @setting_set = SettingSet.find(params[:id])
    @setting_set.destroy

    redirect_to setting_sets_path
  end

  private

  def setting_sets_params
    params.require(:setting_set).permit(:name,
                                       :single_watering_amount,
                                       :min_air_humidity,
                                       :max_air_humidity,
                                       :min_soil_moisture,
                                       :max_soil_moisture,
                                       :min_temperature,
                                       :max_temperature,
                                       :max_insolation,
                                       :min_water_amount)
  end

end
