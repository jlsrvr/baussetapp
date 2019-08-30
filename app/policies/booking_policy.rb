class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin ? scope.all : scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    user_is_owner_or_admin
    Booking.where(id: record.id).exists?
    # scope.where(id: record.id).exists?
    # scope sert dans le application policy pour designer le model dans le quel on est
    # record
  end

  private

  def user_is_owner_or_admin
    user.admin || record.user == user
  end
end
