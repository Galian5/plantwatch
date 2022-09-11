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
      redirect_to @plant
    else
      render 'edit'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:watering, :interval).merge(plant_id: params[:plant_id])
  end
end
