class IncidentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def report?
    record.user == user
  end

  def share?
    report?
  end

  def share_many?
    report?
  end

  def update?
    true
  end

  def edit?
    update?
  end
end
