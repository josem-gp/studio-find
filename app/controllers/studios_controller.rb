class StudiosController < ApplicationController
  def index
    @studios = Studio.all
    
  def show
    @studio = Studio.find(params[:id])
  end
end
