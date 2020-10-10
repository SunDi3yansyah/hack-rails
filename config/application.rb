require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
# require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require 'action_mailbox/engine'
# require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module HackRails
  class Application < Rails::Application
    config.load_defaults 6.0
    config.api_only = true

    config.generators do |g|
      g.helper = false
      g.jbuilder = false
    end

    config.eager_load_paths << Rails.root.join('lib')
    config.exceptions_app = self.routes
    config.time_zone = 'Jakarta'
    config.active_record.default_timezone = :local
    config.active_record.belongs_to_required_by_default = false
    config.active_record.cache_versioning = false
    config.active_record.index_nested_attribute_errors = true
    config.generators.system_tests = nil
    # config.action_cable.mount_path = '/cable'
    # config.action_cable.url = 'wss://example.com/cable'
    config.action_cable.allowed_request_origins = [/http:\/\/*/, /https:\/\/*/]
    config.action_cable.disable_request_forgery_protection = true
  end
end
