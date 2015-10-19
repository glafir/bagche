class BrandPolicy < ApplicationPolicy
  def edit?
    admin or @user.manager?
  end


  def update?
    admin or @user.manager?
  end

  def destroy?
    admin or @user.manager?
  end
end
