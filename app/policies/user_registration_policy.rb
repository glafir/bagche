class UserRegistrationPolicy < ApplicationPolicy
  def new?
    admin
  end

  def create?
    admin
  end

  def edit?
    admin or @user == @user
  end

  def update?
    admin or @user == @user
  end

  def sign_up?
    admin
  end

  def account_update?
    @user == @user
  end
end
