# frozen_string_literal: true

require './lib/hexlib'

class Event < ApplicationRecord
  belongs_to :user
  before_create :assign_event_uid

  validates :title, :start_date, :user_id, presence: true, on: :create

  private

  def assign_event_uid
    self.uid = HexLib.generate_uid
  end
end
