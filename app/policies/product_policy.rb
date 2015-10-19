class ProductPolicy < ApplicationPolicy
  def import?
    writers or @user.manager?
  end

  def index?
    readers
  end

  def create?
    writers or @user.manager?
  end

  def new?
    writers or @user.manager?
  end

  def edit?
    writers or @user.manager?
  end

  def update?
    writers or @user.manager?
  end

  def destroy?
    writers
  end
end
