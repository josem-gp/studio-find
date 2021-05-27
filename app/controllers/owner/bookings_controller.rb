class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking])
  end

  def edit
  end

  def update

  end
end
