class IncidentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    return true
  end

  def create?
    record.user == user
  end

  def show?
    record.user == user
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
    record.user == user
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
