class RecipePolicy < ApplicationPolicy
 class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    record.user == user || record.user == user.admin?
  end

  def destroy?
    record.user == user || record.user == user.admin?
  end
end
