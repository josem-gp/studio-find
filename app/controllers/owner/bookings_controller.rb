class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking])
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize([:owner, @booking])
  end

  def update
    @booking = Booking.find(params[:id])
    authorize([:owner, @booking])
    if @booking.update(booking_params)
      redirect_to owner_bookings_path
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
