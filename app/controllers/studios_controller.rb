class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @place = params[:query]
    @studios = params[:query].present? ? policy_scope(Studio).global_search(params[:query]) : policy_scope(Studio)
    @markers = @studios.geocoded.map do |studio|
      {
        lat: studio.latitude,
        lng: studio.longitude,
        info_window: render_to_string(partial: "info_window", locals: { studio: studio }),
        marker: render_to_string(partial: "marker", locals: { studio: studio })
      }
    end
  end

  def show
    @studio = Studio.find(params[:id])
    @booking = Booking.new
    authorize @studio
  end
end
