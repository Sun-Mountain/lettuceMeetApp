# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  validates :title, :start_date, :user_id, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, 'must be after the start date') if end_date < start_date
  end
end
