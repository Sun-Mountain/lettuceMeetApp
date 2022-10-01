class EventPolicy < ApplicationPolicy
  attr_reader :current_user, :event

  def initialize(current_user, event)
    @current_user = current_user
    @event = event
  end

  def index?
    true
  end

  def create?
    @current_user.has_any_role? :enduser, :beta, :admin, :superadmin || @record.user == @current_user
  end

  def show?
    @current_user.has_any_role? :enduser, :beta, :admin, :superadmin || @record.user == @current_user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
