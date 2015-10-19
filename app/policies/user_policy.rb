class UserPolicy < ApplicationPolicy
  def index?
    # return false unless @user.admin?
    admin || @user.vip?
  end

  def show?
    return false unless @user.admin? || @record.id === @user.id || @user.vip?
    admin
    @record.id != 0
  end

  def new?
    return false unless @user.admin?
    admin
  end

  def create?
    return false unless @user.admin?
    admin
  end

  def edit?
    return false unless @user.admin?
    admin
    @record.id != 0
  end

  def update?
    return false unless @user.admin?
    admin
    @record.id != 0
  end

  def destroy?
    return false unless @user.admin?
    admin
    @record.id != 0
  end
end
