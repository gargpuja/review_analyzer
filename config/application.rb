require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReviewAnalyzer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_job.queue_adapter = :sidekiq
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { :api_token => "3a7abd4d-7033-4db6-a41d-cf358a2db8c0" }
    config.postmark_server_api_token = "3a7abd4d-7033-4db6-a41d-cf358a2db8c0"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
