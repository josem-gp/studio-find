class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @studios = policy_scope(Studio)
    authorize @studios
    @markers = @studios.geocoded.map do |studio|
      {
        lat: studio.latitude,
        lng: studio.longitude
      }
    end
  end

  def show
    @studio = Studio.find(params[:id])
    @booking = Booking.new
    authorize @studio
  end
end
