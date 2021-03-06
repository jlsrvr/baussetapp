class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.where('end_date >= ?', Date.current)
      else
        scope.where(user: user).where('end_date >= ?', Date.current)
      end
    end
  end

  def create?
    true
  end

  def update?
    user_is_owner_or_admin
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

  def decline?
    user.admin && record.status != "declined"
  end

  private

  def user_is_owner_or_admin
    user.admin || record.user == user
  end
end
