class Owner::StudiosController < ApplicationController
  def index
    @studios = policy_scope([:owner, Studio])
    @studio = authorize [:owner, Studio.new]
  end

  def create
    @studio = Studio.new(owner_studio_params)
    @user = current_user
    @studio.user = @user
    authorize [:owner, Studio.new]
    if @studio.save
      redirect_to owner_studios_path
    else
      render :index
    end
  end

  private

  def owner_studio_params
    params.require(:studio).permit(:name, :location, :rate, photos: [])
  end
end
