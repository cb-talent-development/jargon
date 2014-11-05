require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jargon
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec
    end
    config.to_prepare do
      # Only Applications list
      Doorkeeper::ApplicationsController.layout "application"

      # Only Authorization endpoint
      Doorkeeper::AuthorizationsController.layout "application"

      # Only Authorized Applications
      Doorkeeper::AuthorizedApplicationsController.layout "application"
    end
  end
end
