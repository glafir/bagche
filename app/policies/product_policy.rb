class ProductPolicy < ApplicationPolicy
  def import?
    writers or @user.manager?
  end

  def index?
    writers or @user.manager? or @user.client?
  end

  def show?
    true
#    writers or @user.manager? or @user.client?
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
