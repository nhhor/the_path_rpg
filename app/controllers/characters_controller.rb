class CharactersController < ApplicationController

  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:alert] = 'The record you tried to access no longer exists.'
  #   render :sorry   # or e.g. redirect_to :action => :index
  # end




  def index
    if user_signed_in?
      if current_user[:admin]
        @characters = Character.all
      else
        user_id = current_user[:id]
        @characters = Character.a_users_characters(current_user[:id])
      end
      render :index
    else
      render :index
    end
  end

  def new
    @character = Character.new
    render :new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      flash[:notice] = "Character successfully created!"
      redirect_to characters_path
    else
      flash[:alert] = "There was a problem creating this character!"
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
    render :edit
  end

  def show
    @character = Character.find(params[:id])
    render :show
  end

  def update
    @character= Character.find(params[:id])
    @character.character_avatar.attach(params[:character][:character_avatar])
    if @character.update(character_params)
      flash[:notice] = "Character successfully updated!"
      redirect_to characters_path
    else
      flash[:alert] = "There was a problem updating this character!"
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Character successfully removed!"

    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_path
  end

  private
  def character_params
    params.require(:character).permit(:character_name, :user_id, :character_health)
  end

end
