class UrnaPolicy < ApplicationPolicy
  
  def new?
    true
  end
  
  def edit?
    true
  end
  
  def destroy?
    user.completo?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end