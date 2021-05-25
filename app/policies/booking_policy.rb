class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Booking.all
    end
  end

  def create?
    true
  end
end
