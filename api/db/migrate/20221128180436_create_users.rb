# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstName,          null: false, default: ''
      t.string :lastName,           null: false, default: ''
      t.string :preferredUsername,  null: false, default: ''
      t.string :email,              null: false, default: ''
      t.string :password_digest,    null: false, default: ''

      t.timestamps
    end
  end
end
