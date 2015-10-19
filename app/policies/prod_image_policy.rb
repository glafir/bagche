class ProdImagePolicy < ApplicationPolicy
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
    writers or @user.manager?
  end
end
