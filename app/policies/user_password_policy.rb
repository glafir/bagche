class UserPasswordPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end

  def edit?
#    admin or @user == @user
    true
  end

  def update?
#    admin or @user == @user
    true
  end
end
