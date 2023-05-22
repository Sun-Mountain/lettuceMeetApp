require 'cgi'

class Event < ApplicationRecord
  belongs_to :user
  before_create :assign_event_uid
  # before_save :parse_date

  validates :event_title, :start_date, :user, presence: true

  private

  def assign_event_uid
    loop do
      self.uid = SecureRandom.hex(10)
      break self.uid unless Event.where(uid: uid).exists?
    end
  end

  def parse_date
    startDateStr = self.start_date
    self.start_date = Date.parse(startDateStr)
  end
end
