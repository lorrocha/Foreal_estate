class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to buildings_path, notice:'Building was successfully created'
    else
      render :new
    end
  end

  private

  def building_params
    params.require(:building).permit(:street_address,:description, :city, :state, :postal_code)
  end
end
