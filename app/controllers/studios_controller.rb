class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end
    
  def show
    @studio = Studio.find(params[:id])
    @booking = Booking.new
  end
end
