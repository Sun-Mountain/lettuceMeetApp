# frozen_string_literal: true

desc 'Assign user roles where nil'

task assign_user_roles: :environment do
  User.find_each do |u|
    if u.email == 'npzonnenberg@gmail.com'
      u.role = 'superadmin'
      u.save!
    end
  end
end
