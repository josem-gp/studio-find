class StudiosController < ApplicationController
  def index
    @studios = policy_scope(Studio)
    authorize @studios
  end

  def show
    @studio = Studio.find(params[:id])
    authorize @studio
  end
end
