class RivalsController < ApplicationController

  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:alert] = 'The record you tried to access no longer exists.'
  #   render :sorry   # or e.g. redirect_to :action => :index
  # end

  def index
    # @user = current_user[:id]
    # @rivals = Rival.all
    if user_signed_in?
      user_id = current_user[:id]
      @rivals = Rival.all
      # binding.pry
      render :index
    else
      render :index
    end
  end

  def new
    @rival = Rival.new
    render :new
  end

  def create
    @rival = Rival.new(rival_params)

    # binding.pry

    if @rival.save
      flash[:notice] = "Rival successfully created!"
      redirect_to rivals_path
    else
      flash[:alert] = "There was a problem creating this rival!"
      render :new
    end
  end

  def edit
    @rival = Rival.find(params[:id])
    render :edit
  end

  def show
    @rival = Rival.find(params[:id])
    render :show
  end

  def update
    @rival= Rival.find(params[:id])
    @rival.rival_avatar.attach(params[:rival][:rival_avatar])

    if @rival.update(rival_params)
      flash[:notice] = "Rival successfully updated!"
      redirect_to rivals_path
    else
      flash[:alert] = "There was a problem updating this rival!"
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Rival successfully removed!"

    @rival = Rival.find(params[:id])
    @rival.destroy
    redirect_to rivals_path
  end

  private
  def rival_params
    params.require(:rival).permit(:rival_name, :rival_health)
  end

end
