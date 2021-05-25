class StudioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Studio.all
    end
  end

  def index?
    true
  end
end
