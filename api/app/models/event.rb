class Event < ApplicationRecord
  belongs_to :user
  before_create :assign_event_uuid

  validates :title, :start_date, :user_id, presence: true, on: :create

  private

  def assign_event_uuid
    self.uuid = SecureRandom.uuid
  end
end
