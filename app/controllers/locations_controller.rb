class LocationsController < ApplicationController

  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:alert] = 'The record you tried to access no longer exists.'
  #   render :sorry   # or e.g. redirect_to :action => :index
  # end

  def index
    # @user = current_user[:id]
    # @locations = Location.all
    if user_signed_in?
      user_id = current_user[:id]
      @locations = Location.all
      # binding.pry
      render :index
    else
      render :index
    end
  end

  def new
    @location = Location.new
    render :new
  end

  def create
    @location = Location.new(location_params)

    # binding.pry

    if @location.save
      flash[:notice] = "Location successfully created!"
      redirect_to locations_path
    else
      flash[:alert] = "There was a problem creating this location!"
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
    render :edit
  end

  def show
    @location = Location.find(params[:id])
    render :show
  end

  def update
    @location= Location.find(params[:id])
    if @location.update(location_params)
      flash[:notice] = "Location successfully updated!"
      redirect_to locations_path
    else
      flash[:alert] = "There was a problem updating this location!"
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Location successfully removed!"

    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path
  end

  private
  def location_params
    params.require(:location).permit(:location_name, :location_description)
  end

end
