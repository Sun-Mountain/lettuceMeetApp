# frozen_string_literal: true

class RemoveAuthorizedFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :authorized, :boolean
    remove_column :users, :admin, :boolean
  end
end
