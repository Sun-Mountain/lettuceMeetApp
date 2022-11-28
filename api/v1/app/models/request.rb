class Request < ApplicationRecord
  belongs_to :user

  # ArgumentError: You tried to define an enum named "method" on the model "Request",
  # but this will generate a class method "delete", which is already defined by Active Record.
  enum method: [:get, :post, :put, :patch, :delete], _suffix: true

  validates :method, :requestable_type, :user, presence: true
  validates :requestable_type, inclusion: { in: %w(Post) }
end
