class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @studios = policy_scope(Studio)
    authorize @studios
    @markers = @studios.geocoded.map do |studio|
      {
        lat: studio.latitude,
        lng: studio.longitude
        # info_window: render_to_string(partial: "info_window", locals: { studio: studio })
      }
    end
  end

  def show
    @studio = Studio.find(params[:id])
    @booking = Booking.new
    authorize @studio
  end
end
