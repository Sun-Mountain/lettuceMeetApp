# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name,          null: false, default: ''
      t.string :last_name,           null: false, default: ''
      t.string :preferred_username,  null: false, default: ''
      t.string :email,              null: false, default: ''

      t.timestamps
    end
  end
end
