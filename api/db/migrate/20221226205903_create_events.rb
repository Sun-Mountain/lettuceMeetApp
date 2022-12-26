class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title,      null: false, default: ''
      t.text :body,         default: ''
      t.string :location,   null: false, default: ''
      t.boolean :public,    null: false, default: false
      t.date :start_date,   null: false, default: Date.today
      t.date :end_date,     default: ''
      t.time :start_time,   default: ''
      t.time :end_time,     default: ''
      t.references :user,   null: false, foreign_key: true

      t.timestamps
    end
  end
end
