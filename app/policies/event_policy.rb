# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  attr_reader :user, :scope, :record
  class Scope < Scope
    def resolve
      if user.admin? || user.superadmin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def show?
    user.id == record.user_id || user.admin? || user.superadmin?
  end

  def update?
    user.id == record.user_id || user.admin? || user.superadmin?
  end

  def destroy?
    user.id == record.user_id || user.admin? || user.superadmin?
  end
end
