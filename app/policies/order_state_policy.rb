class OrderStatePolicy < ApplicationPolicy
  def index?
    readers
  end

  def show?
    readers
  end

  def new?
    writers
  end

  def create?
    writers
  end

  def edit?
    writers
  end

  def update?
    writers
  end

  def destroy?
    writers
  end
end
