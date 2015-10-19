class FlashMessagePolicy < ApplicationPolicy
class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def index?
      if user.admin?
        scope.all
      else
        scope.where(user_id: @user.id)
      end
    end
  end

  def show?
    admin or @record.user_id == @user.id
  end

  def create?
    false
  end

  def new?
    false
  end

  def edit?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
