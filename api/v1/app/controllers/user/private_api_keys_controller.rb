class User::PrivateApiKeysController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update(private_api_key: SecureRandom.hex)
      redirect_to edit_user_registration_path, notice: "API Updated"
    else
      redirect_to edit_user_registration_path, alert: "There was an error: #{current_user.errors.full_messages.to_sentence}"
    end
  end
end
