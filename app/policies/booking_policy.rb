class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin ? scope.all : scope.where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    user_is_owner_or_admin
  end

  private

  def user_is_owner_or_admin
    user.admin || record.user == user
  end
end
