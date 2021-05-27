class Owner::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.bookings_as_owner
    end
  end

  def index?
    true
  end

  def edit?
    user.bookings_as_owner.include?(record)
  end

  def update?
    user.bookings_as_owner.include?(record)
  end
end
