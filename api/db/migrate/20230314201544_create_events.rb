class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :uid,      null: false
      t.string :eventTitle,    null: false
      t.text :description
      t.boolean :private, default: false, null: false
      t.boolean :allDay,  default: true, null: false
      t.date :startDate,  null: false
      t.date :endDate
      t.time :startTime
      t.time :endTime
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
