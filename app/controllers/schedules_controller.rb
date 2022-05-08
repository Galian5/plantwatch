class SchedulesController < ApplicationController

  def show
  end

  def new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @schedule = @plant.schedule.create(schedule_params)
    redirect_to plant_path(@plant)
  end

  def update
  end

  def destroy
  end

  private

  def schedule_params
    params.require(schedule).permit(:watering, :interval)
  end
end
