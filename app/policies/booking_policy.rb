class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    Booking.where(id: record.id).exists?
    # scope.where(id: record.id).exists?
    # scope sert dans le application policy pour designer le model dans le quel on est
    # record
  end
end
