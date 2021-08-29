class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.sender == user || record.recipient == user
  end

  def update?
    record.sender == user || record.recipient == user
  end
end
