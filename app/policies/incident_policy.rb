class IncidentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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

  def update?
    return true
  end

  def edit?
    update?
  end
end
