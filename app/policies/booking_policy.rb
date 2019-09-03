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

  def change_status?
    user.admin
  end

  def add_beds?
    user.admin && record.status != "accepted"
  end

  def choose_beds?
    add_beds?
  end

  def destroy?
    user_is_owner_or_admin
  end

  private

  def user_is_owner_or_admin
    user.admin || record.user == user
  end
end
