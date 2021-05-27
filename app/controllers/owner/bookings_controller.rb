class Owner::BookingsController < ApplicationController
  def index
    @bookings = authorize [:owner, current_user.bookings]
    policy_scope(@bookings)
  end

  def edit
    @booking = authorize [:owner, Booking.find(params[:id])]
  end

  def update

  end
end
