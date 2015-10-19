class CommentPolicy < ApplicationPolicy
  def index?
    readers
  end

  def show?
    readers
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
