class PlantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @plants = current_user.plants.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = current_user.plants.new(plant_params)

    if @plant.save
      redirect_to @plant
    else
      render 'new'
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])

    if @plant.update(plant_params)
      redirect_to @plant
    else
      render 'edit'
    end
  end
  
  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy

    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :device_id, photos: [])
  end

end
