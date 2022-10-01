# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, dependent: :destroy

  after_initialize :set_default_role, if: :new_record?
  enum role: %i[enduser beta admin superadmin]

  def set_default_role
    self.role ||= :enduser
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
