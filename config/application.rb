require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TemplateMaster
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    
    config.time_zone = 'Berlin'
    
    config.load_defaults 5.1
    
    config.sass.preferred_syntax = :sass
    
    config.generators do |g|
      g.template_engine :slim
    end
    
    config.action_dispatch.rescue_responses.merge! 'CanCan::AccessDenied' => :forbidden
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:              Rails.application.secrets.smtp_address,
  port:                 Rails.application.secrets.smtp_port,
  domain:               Rails.application.secrets.smtp_domain,
  user_name:            Rails.application.secrets.smtp_user_name,
  password:             Rails.application.secrets.smtp_password,
  authentication:       Rails.application.secrets.smtp_authentication,
  enable_starttls_auto: Rails.application.secrets.smtp_enable_starttls_auto,
  ssl:                  Rails.application.secrets.smtp_ssl
}