# frozen_string_literal: true

desc 'Assign user roles where nil'

task assign_user_roles: :environment do
  User.find_each do |u|
    if u.role.nil?
      u.role = 0
      u.save!
    end
  end
end
