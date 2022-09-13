class SchedulesController < ApplicationController

  def show
    @plant = Plant.find(params[:plant_id])
    @schedule = @plant.schedule
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      set_watering_schedule
      redirect_to plants_path(@plant)
    else
      render 'new'
    end
  end

  def edit
    @plant = Plant.find(params[:plant_id])
    @schedule = Schedule.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:plant_id])
    @schedule = Schedule.find(params[:id])

    if @schedule.update(schedule_params)
      set_watering_schedule
      redirect_to @plant
    else
      render 'edit'
    end
  end

  def set_watering_schedule
    Thread.new do
      params = { "watering" => @schedule.watering, "interval" => @schedule.interval,
                 "watering_amount" => @plant.setting.single_watering_amount
      }
      while true
        if @plant.device.uri_address
          x = Net::HTTP.post_form(URI.parse(@plant.device.uri_address), params)
          puts x.body

          sleep((schedule.interval).hours)
        end
      end
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:watering, :interval).merge(plant_id: params[:plant_id])
  end
end
