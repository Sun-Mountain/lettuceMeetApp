class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.superadmin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end

    private

    attr_reader :user, :scope
  end

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
    current_user.id == event.user_id || current_user.admin? || current_user.superadmin?
  end

  def update?
    current_user.id == event.user_id || current_user.admin? || current_user.superadmin?
  end

  def destroy?
    current_user.id == event.user_id || current_user.admin? || current_user.superadmin?
  end

  private

  attr_reader :current_user, :event
end
