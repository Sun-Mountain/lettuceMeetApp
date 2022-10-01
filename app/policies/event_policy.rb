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
    true
  end

  def show?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
