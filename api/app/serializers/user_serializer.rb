class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :created_at, :first_name, :last_name, :preferred_username, :admin
  attribute :created_date do |user|
    user.created_at && user.created_at.strftime('%m/%d/%Y')
  end
end
