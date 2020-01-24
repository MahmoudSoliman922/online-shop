# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.api_only = true
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

    # configure time zone
    config.time_zone = 'Africa/Cairo'
    config.active_record.default_timezone = :local

    I18n.enforce_available_locales = false
    I18n.config.available_locales = :ar
    config.i18n.default_locale = :en

    # config.cache_store = :redis_store, "redis://redis:6379/0/cache", { expires_in: 90.minutes }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # config cors
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: %i[get post put patch delete options head]
      end
    end
  end
end
