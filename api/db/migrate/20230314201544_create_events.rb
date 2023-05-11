class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :uid,      null: false
      t.string :event_title,    null: false
      t.text :description
      t.boolean :private, default: false, null: false
      t.boolean :all_day,  default: true, null: false
      t.date :start_date,  null: false
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
