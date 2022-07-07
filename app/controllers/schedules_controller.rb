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
    # @schedule = @plant.schedule.create(schedule_params)
    @schedule = Schedule.new(schedule_params)
    p schedule_params

    if @schedule.save

      redirect_to plants_path(@schedule.plant_id)
    else
      p @schedule
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @plant = Plant.find(params[:plant_id])
    @schedule = Schedule.find(params[:id])
  end

  private

  def schedule_params
    params.require(:schedule).permit(:watering, :interval).merge(plant_id: params[:plant_id])
  end
end
