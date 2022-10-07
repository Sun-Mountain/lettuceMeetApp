# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    user.admin? || user.superadmin?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
