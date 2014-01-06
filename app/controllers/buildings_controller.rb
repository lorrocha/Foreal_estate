class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
    @owners = Owner.all
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to buildings_path, notice:'Building was successfully created'
    else
      render :new
    end
  end

  def show
    @building = Building.find(params[:id])
  end

  private

  def building_params
    params.require(:building).permit(:owner_id,:street_address,:description, :city, :state, :postal_code)
  end
end
