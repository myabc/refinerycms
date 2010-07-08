require File.expand_path('../boot', __FILE__)


require 'action_controller/railtie'
require 'action_mailer/railtie'
# require 'active_resource/railtie'
require 'rake/testtask' # FIXME: This should not be required here, but is needed
                        #        to avoid an uninitialized constant error resulting
                        #        from how dm-rails sets up the load path.
require 'dm-rails/railtie'
require 'rails/test_unit/railtie'

# Auto-require default libraries and those for the current Rails environment.
Bundler.require :default, Rails.env

$LOAD_PATH << File.expand_path('../../vendor/engines/refinery/lib', __FILE__)
require 'refinery'
require File.expand_path('../../lib/refinery_initializer', __FILE__)

module Refinerycms
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{Rails.root}/vendor/engines/refinery/lib )

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure generators values. Many other options are available, be sure to check the documentation.
    # config.generators do |g|
    #   g.orm             :active_record
    #   g.template_engine :erb
    #   g.test_framework  :test_unit, :fixture => true
    # end

    config.middleware.insert_after 'Rack::Lock', 'Dragonfly::Middleware', :images
    config.middleware.insert_after 'Rack::Lock', 'Dragonfly::Middleware', :resources
    config.middleware.insert_before 'Dragonfly::Middleware', 'Rack::Cache', {
      :verbose     => true,
      :metastore   => "file:#{Rails.root}/tmp/dragonfly/cache/meta",
      :entitystore => "file:#{Rails.root}/tmp/dragonfly/cache/body"
    }

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirmation]
  end
end

# You can set things in the following file and we'll try hard not to destroy them in updates, promise.
# Note: These are settings that aren't dependent on environment type. For those, use the files in config/environments/
require Rails.root.join('config', 'settings.rb').to_s

# Bundler has shown a weakness using Rails < 3 so we are going to
# require these dependencies here until we can find another solution or until we move to
# Rails 3.0 which should fix the issue (or until Bundler fixes the issue).
require_dependency 'will_paginate'
