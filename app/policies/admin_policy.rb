class AdminPolicy < ApplicationPolicy
#class AdminPolicy < Struct.new(:user, :admin)
#  def initialize(user, record)
#    raise Pundit::NotAuthorizedError, "must be logged in" unless user
#    @user = user
#    @record = record
#  end

  def index?
    admin
  end

  def ext?
    admin
  end

  def direct?
    admin
  end

  def dispatcher?
    admin
  end
end
