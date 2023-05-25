class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :uid, :event_title, :description, :private, :all_day, :start_date, :end_date, :start_time, :end_time, :user_id
  attribute :created_at do |event|
    event.created_at && event.created_at.strftime('%m/%d/%Y')
  end
end