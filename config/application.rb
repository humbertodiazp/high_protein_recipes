require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HighProteinRecipes
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.skip_routes true
      g.helper false
      g.assets false
      g.test_framework :rspec, fixture: false
      g.helper_specs false
      g.controller_specs false
      g.system_tests false
      g.view_specs false
    end

    config.to_prepare do
      Devise::SessionsController.layout "auth"
      # DeviseInvitable::RegistrationsController.layout "auth"
      # Devise::InvitationsController.layout "auth"
      Devise::RegistrationsController.layout "auth"
      Devise::ConfirmationsController.layout "auth"
      Devise::UnlocksController.layout "auth"
      Devise::PasswordsController.layout "auth"
      Devise::Mailer.layout "mailer"
    end

    #GZip all responses
    config.middleware.use Rack::Deflater
  end 
end
