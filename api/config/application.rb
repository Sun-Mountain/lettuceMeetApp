# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LettuceMeetApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.session_store :cookie_store, key: '_interslice_session'
      config.middleware.use ActionDispatch::Cookies
      config.middleware.use config.session_store, config.session_options

    config.api_only = true
    config.hosts.clear

    # Don't generate system test files.
    config.generators.system_tests = nil

    # field_with_errors support, avoid that nasty line break on errors
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }

    config.active_job.queue_adapter = :sidekiq

    # Sending mail with`DeliveryJob` has been deprecated. Work has been moved to `MailDeliveryJob`
    config.action_mailer.delivery_job = "ActionMailer::MailDeliveryJob"

    config.to_prepare { Devise::Mailer.layout "mailer" }

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
