# frozen_string_literal: true

module HexLib
  def self.generate_uid
    loop do
      uid = SecureRandom.hex(10)
      break uid unless Event.where(uid: uid).exists?
    end
  end
end
