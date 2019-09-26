class AditivoPolicy < ApplicationPolicy
  
  def show?
    user.completo?
  end
  
  def new?
    user.completo?
  end
  
  def edit?
    user.completo?
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