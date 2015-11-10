class BrandPolicy < ApplicationPolicy
  def edit?
    admin or @user.manager?
  end

  def index?
    writers or @user.manager?
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
    admin or @user.manager?
  end

  def destroy?
    admin or @user.manager?
  end
end
