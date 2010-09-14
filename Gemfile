source 'http://rubygems.org'
gem 'bundler',                  '~> 1.0.0'

RAILS_VERSION = '3.0.0'
DM_VERSION    = '~> 1.0.0'

# Specify the database driver as appropriate for your application (only one is necessary).
# Defaults to sqlite3. Don't remove any of these below in the core or gems won't install.
gem 'dm-sqlite-adapter',    DM_VERSION
# gem 'dm-mysql-adapter',     DM_VERSION
# gem 'dm-postgres-adapter',  DM_VERSION
# gem 'dm-oracle-adapter',    DM_VERSION
# gem 'dm-sqlserver-adapter', DM_VERSION

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby',             :require => 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'
# gem 'mongrel', :group => :development

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# REFINERY CMS ================================================================

# Specify the Refinery CMS core:
gem 'refinerycms',              :path => '.'

# Specify additional Refinery CMS Engines here (all optional):
# gem 'refinerycms-inquiries',    '~> 0.9.8.7'
# gem 'refinerycms-news',       '~> 0.9.9'
# gem 'refinerycms-portfolio',  '~> 0.9.8'
# gem 'refinerycms-theming',    '~> 0.9.8'

# Add i18n support (optional, you can remove this if you really want to).
gem 'refinerycms-i18n',         '~> 0.9.8.6', :require => 'refinery/i18n'

# Specify a version of RMagick that works in your environment:
gem 'rmagick',                  '~> 2.12.0', :require => false

# END REFINERY CMS ============================================================

# REFINERY CMS DEVELOPMENT ====================================================

group :test do
  # RSpec
  gem 'rspec',                  (RSPEC_VERSION = '~> 2.0.0.beta')
  gem 'rspec-core',             RSPEC_VERSION, :require => 'rspec/core'
  gem 'rspec-expectations',     RSPEC_VERSION, :require => 'rspec/expectations'
  gem 'rspec-mocks',            RSPEC_VERSION, :require => 'rspec/mocks'
  gem 'rspec-rails',            RSPEC_VERSION
  # Cucumber
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork' unless Bundler::WINDOWS
  gem 'launchy'
  gem 'gherkin'
  # TODO: Change back to gem when patch is merged in
  gem 'rack-test',              :git => 'git://github.com/alan/rack-test.git'
  # FIXME: JSON constant constants warnings
  gem 'json_pure',              '~> 1.4.6', :require => 'json/pure'
  # Factory Girl
  gem 'factory_girl'
  gem 'ruby-prof'
  # Autotest
  gem 'autotest'
  gem 'autotest-rails'
  gem 'autotest-notification'
end

# END REFINERY CMS DEVELOPMENT =================================================
