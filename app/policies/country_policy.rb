class CountryPolicy < ApplicationPolicy
  def index?
    readers
  end

  def show?
    readers
  end


  def tw_show?
    readers
  end

  def edit?
    admin
  end


  def update?
    admin
  end

  def destroy?
    admin
  end
end
