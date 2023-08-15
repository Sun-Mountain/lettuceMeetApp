class AddConfirmedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirmed, :string
  end
end
