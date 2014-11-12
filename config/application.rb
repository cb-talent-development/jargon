require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Jargon
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec
    end
    config.to_prepare do
      Doorkeeper::ApplicationsController.layout "application"

      Doorkeeper::AuthorizationsController.layout "application"

      Doorkeeper::AuthorizedApplicationsController.layout "application"
    end
  end
end
