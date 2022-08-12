class AddsAdminColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :authorized, :boolean, default: false, null: false
    add_column :users, :admin, :boolean, default: false, null: false
    add_column :users, :role, :string, default: ''
  end
end
