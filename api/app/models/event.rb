class Event < ApplicationRecord
  belongs_to :user

  validate :title, :location, :public, :start_date, presence: :true
end
