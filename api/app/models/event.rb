require 'cgi'

class Event < ApplicationRecord
  belongs_to :user
  before_create :assign_event_uid
  # before_save :parse_date

  validates :eventTitle, :startDate, :user, presence: true, on: :create

  private

  def assign_event_uid
    loop do
      self.uid = SecureRandom.hex(10)
      break self.uid unless Event.where(uid: uid).exists?
    end
  end

  def parse_date
    startDateStr = self.startDate
    self.startDate = Date.parse(startDateStr)
  end
end
