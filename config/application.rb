require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Workspace
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Layouts for Devise views
    config.to_prepare do
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? 'application' : 'registrations' }
      Devise::SessionsController.layout 'sessions'
      Devise::PasswordsController.layout proc { |controller| user_signed_in? ? 'application' : 'sessions' }
    end

    # Use custom error pages
    config.exceptions_app = self.routes

    # Pundit forbidden page
    config.action_dispatch.rescue_responses['Pundit::NotAuthorizedError'] = :forbidden

  end
end
