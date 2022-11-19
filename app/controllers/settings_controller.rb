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
    @setting_set ||= SettingSet.find(params[:setting][:setting_set]) unless params[:setting][:setting_set].blank?
    if @setting_set
      @setting = Setting.new(plant_id:setting_params[:plant_id],
                             single_watering_amount:@setting_set.single_watering_amount,
                             min_air_humidity: @setting_set.min_air_humidity,
                             max_air_humidity: @setting_set.max_air_humidity,
                             min_soil_moisture: @setting_set.min_soil_moisture,
                             max_soil_moisture: @setting_set.max_soil_moisture,
                             min_temperature: @setting_set.min_temperature,
                             max_temperature: @setting_set.max_temperature,
                             max_insolation: @setting_set.max_insolation,
                             min_water_amount: @setting_set.min_water_amount)
      if @setting.save!
        redirect_to plants_path(@setting.plant_id)
      else
        render 'new'
      end
    else
      @setting = Setting.new(single_watering_amount:setting_params[:single_watering_amount],
                             min_air_humidity: setting_params[:min_air_humidity],
                             max_air_humidity: setting_params[:max_air_humidity],
                             min_soil_moisture: setting_params[:min_soil_moisture],
                             max_soil_moisture: setting_params[:max_soil_moisture],
                             min_temperature: setting_params[:min_temperature],
                             max_temperature: setting_params[:max_temperature],
                             max_insolation: setting_params[:max_insolation],
                             min_water_amount: setting_params[:min_water_amount],
                             plant_id:setting_params[:plant_id])

      if @setting.save!
        redirect_to plants_path(@setting.plant_id)
      else
        render 'new'
      end
    end
  end

  def edit
    @plant = Plant.find(params[:plant_id])
    @setting = Setting.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:plant_id])
    @setting_set ||= SettingSet.find(params[:setting][:setting_set]) unless params[:setting][:setting_set].blank?
    @setting = Setting.find(params[:id])
    if @setting_set
      if @setting.update(plant_id:setting_params[:plant_id],
                             single_watering_amount:@setting_set.single_watering_amount,
                             min_air_humidity: @setting_set.min_air_humidity,
                             max_air_humidity: @setting_set.max_air_humidity,
                             min_soil_moisture: @setting_set.min_soil_moisture,
                             max_soil_moisture: @setting_set.max_soil_moisture,
                             min_temperature: @setting_set.min_temperature,
                             max_temperature: @setting_set.max_temperature,
                             max_insolation: @setting_set.max_insolation,
                             min_water_amount: @setting_set.min_water_amount)
        redirect_to plant_setting_path
      else
        render 'edit'
      end
    else
      if @setting.update!(single_watering_amount:setting_params[:single_watering_amount],
                             min_air_humidity: setting_params[:min_air_humidity],
                             max_air_humidity: setting_params[:max_air_humidity],
                             min_soil_moisture: setting_params[:min_soil_moisture],
                             max_soil_moisture: setting_params[:max_soil_moisture],
                             min_temperature: setting_params[:min_temperature],
                             max_temperature: setting_params[:max_temperature],
                             max_insolation: setting_params[:max_insolation],
                             min_water_amount: setting_params[:min_water_amount],
                             plant_id:setting_params[:plant_id])
        redirect_to plant_setting_path
      else
        render 'edit'
      end
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
                                    :min_water_amount,
                                    :setting_set).merge(plant_id: params[:plant_id])
  end
end
