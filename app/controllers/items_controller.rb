class ItemsController < ApplicationController

  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:alert] = 'The record you tried to access no longer exists.'
  #   render :sorry   # or e.g. redirect_to :action => :index
  # end
  before_action :authorize, only: []
  before_action :authorize_admin, only: [:new, :create, :edit, :destroy]


  def index
    # @user = current_user[:id]
    # @items = Item.all
    if user_signed_in?
      user_id = current_user[:id]
      @items = Item.all
      # binding.pry
      render :index
    else
      render :index
    end
  end

  def new
    @item = Item.new
    render :new
  end

  def create
    @item = Item.new(item_params)

    # binding.pry

    if @item.save
      flash[:notice] = "Item successfully created!"
      redirect_to items_path
    else
      flash[:alert] = "There was a problem creating this item!"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    render :edit
  end

  def show
    @item = Item.find(params[:id])
    render :show
  end

  def update
    @item= Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "Item successfully updated!"
      redirect_to items_path
    else
      flash[:alert] = "There was a problem updating this item!"
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Item successfully removed!"

    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_type, :item_stat)
  end

end
