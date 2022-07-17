class CreateJwtDenylist < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_denylist do |t|
      t.string :jti
      t.datetime :exp

      t.timestamps
    end
  end
end
