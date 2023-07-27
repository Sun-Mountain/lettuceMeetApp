# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'confirmation@lettucemeet.app'
  layout 'mailer'
end
