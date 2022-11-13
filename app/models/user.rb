# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, dependent: :destroy

  after_create :set_default_role
  enum role: %i[enduser beta admin superadmin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  private

  def set_default_role
    current_user.role = 0
  end
end
