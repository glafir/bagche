class UserRegistrationPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end

  def edit?
    admin or @user == @user
  end

  def update?
    admin or @user == @user
  end

  def sign_up?
    true
  end

  def account_update?
    @user == @user
  end
end
