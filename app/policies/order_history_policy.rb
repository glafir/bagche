class OrderHistoryPolicy < ApplicationPolicy
  def index?
    readers
  end

  def show?
    readers
  end

  def new?
    false
  end

  def create?
    writers or @user.manager? or @user.client?
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
