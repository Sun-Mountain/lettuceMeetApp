class Event < ApplicationRecord
  belongs_to :user

  validates :title, :start_date, :user_id, presence: true, on: :create
end
