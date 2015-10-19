class OrderPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.nil?
        return false 
      else
        if user.admin?
          scope.all
         else
          scope.where(user_id: @user.id)
        end
      end
    end
  end

#  def index?
#    return false if @user.unknown?
#  end

  def show?
    writers or @record.user_id === @user.id
  end

  def new?
    writers or @user.manager? or @user.client?
  end

  def create?
    writers or @user.manager? or @record.user_id === @user.id
  end

  def edit?
    writers or @user.manager?
  end

  def update?
    writers or @user.manager?
  end

  def destroy?
    false
  end
end
