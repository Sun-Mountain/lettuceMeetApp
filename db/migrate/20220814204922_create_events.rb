class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title,        null: false, default: ''
      t.boolean :public,      null: false, default: false
      t.boolean :all_day,     null: false, default: false
      t.date :start_date,     null: false, default: ''
      t.date :end_date,       default: ''
      t.time :start_time,     default: ''
      t.time :end_time,       default: ''
      t.text :description,    default: ''
      t.references :user,     null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
