class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    writers or @user.manager? or @user.client?
  end

  def create?
    writers or @user.manager? or @user.client?
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
