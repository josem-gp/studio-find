class Owner::StudioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.studios
    end
  end

  def index?
    true
  end

  def create?
    true
  end
end
