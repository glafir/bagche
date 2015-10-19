class UserTracingPolicy < ApplicationPolicy
  def show?
    admin or @record.user_id == @user.id
  end

  def edit?
    false
  end

  def update?
    false
  end

  def new?
    false
  end

  def create?
    false
  end

  def destroy?
    false
  end
end
