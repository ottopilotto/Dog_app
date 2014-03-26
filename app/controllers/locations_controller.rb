class LocationsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @locations = Location.all
    
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)
      if @location.save 
        redirect_to @location, notice: "Successfully created location."
      else
        render action: 'new'
      end
  end

  def edit
    @location=Location.find(params[:id]) 
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      redirect_to @location, notice: "Successfully updated location"
    else
      render action: 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, notice: "Successfully destroyed location."
  end

private
  
  def location_params
    params.require(:location).permit(:name, :address, :longitude, :latitude)  
  end



end

