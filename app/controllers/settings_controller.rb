class SettingsController < ApplicationController

  def show
    @plant = Plant.find(params[:plant_id])
    @setting = @plant.setting
  end

  def new
    @setting = Setting.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to plants_path(@setting.plant_id)
    else
      render 'new'
    end
  end

  def edit
    @plant = Plant.find(params[:plant_id])
    @setting = Setting.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:plant_id])
    @setting = Setting.find(params[:id])

    if @setting.update(setting_params)
      redirect_to @plant
    else
      render 'edit'
    end
  end

  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy

    redirect_to plants_path(@setting.plant_id)
  end

  private

  def setting_params
    params.require(:setting).permit(:single_watering_amount,
                                    :min_air_humidity,
                                    :max_air_humidity,
                                    :min_soil_moisture,
                                    :max_soil_moisture,
                                    :min_temperature,
                                    :max_temperature,
                                    :max_insolation,
                                    :min_water_amount).merge(plant_id: params[:plant_id])
  end
end
