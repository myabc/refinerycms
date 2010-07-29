source :rubygems

RAILS_VERSION = '3.0.0.rc'
DM_VERSION    = '~> 1.0.0'
RSPEC_VERSION = '~> 2.0.0.beta.19'

# Specify the database driver as appropriate for your application (only one is necessary).
# Defaults to sqlite3. Don't remove any of these below in the core or gems won't install.
gem 'dm-sqlite-adapter',    DM_VERSION
# gem 'dm-mysql-adapter',     DM_VERSION
# gem 'dm-postgres-adapter',  DM_VERSION
# gem 'dm-oracle-adapter',    DM_VERSION
# gem 'dm-sqlserver-adapter', DM_VERSION

# Specify your favourite web server (only one) - not required.
#gem 'unicorn', :group => :development
#gem 'mongrel', :group => :development

# Deploy with Capistrano
# gem 'capistrano'

# If you are using s3 you probably want this gem:
# gem 'aws-s3'

#===REFINERY REQUIRED GEMS===
gem 'refinerycms',      :path => '.'

gem 'activesupport',    RAILS_VERSION, :require => 'active_support'
gem 'actionmailer',     RAILS_VERSION, :require => 'action_mailer'
gem 'actionpack',       RAILS_VERSION, :require => 'action_pack'
gem 'railties',         RAILS_VERSION, :require => 'rails'
gem 'dm-rails',         DM_VERSION, :git => 'git://github.com/datamapper/dm-rails'
gem 'dm-migrations',    DM_VERSION
gem 'dm-types',         DM_VERSION
gem 'dm-validations',   DM_VERSION
gem 'dm-constraints',   DM_VERSION
gem 'dm-transactions',  DM_VERSION
gem 'dm-aggregates',    DM_VERSION
gem 'dm-timestamps',    DM_VERSION
gem 'dm-observer',      DM_VERSION
gem 'dm-is-tree',       DM_VERSION
gem 'dm-ar-finders',    DM_VERSION
gem 'devise',           '~> 1.1.1'
gem 'dm-devise',        '~> 1.1.0', :git => 'git://github.com/jm81/dm-devise'
gem 'rmagick',        '~> 2.12.0'
gem 'rack-cache',       :require => 'rack/cache'
#gem 'dragonfly',        :git => 'git://github.com/myabc/dragonfly.git',
#                        :branch => '1.9.2-fixes'
#gem 'acts_as_indexed', '= 0.6.3'
#gem 'friendly_id',    '~> 3.0'
gem 'truncate_html',    '= 0.3.2',
                        :require => 'truncate_html'

gem 'will_paginate',    '3.0.pre2',
                        :git => "git://github.com/mislav/will_paginate.git",
                        :branch => 'rails3'

group :test do
  #gem 'json_pure',      :require => 'json/pure',
  #                      :git => 'git://github.com/parndt/json.git',
  #                      :branch => 'master'
  gem 'rspec',              RSPEC_VERSION
  gem 'rspec-core',         RSPEC_VERSION, :require => 'rspec/core'
  gem 'rspec-expectations', RSPEC_VERSION, :require => 'rspec/expectations'
  gem 'rspec-mocks',        RSPEC_VERSION, :require => 'rspec/mocks'
  gem 'rspec-rails',        RSPEC_VERSION
  gem 'test-unit',      '= 1.2.3'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork' unless RUBY_PLATFORM =~ /mswin|mingw/
  gem 'launchy'
  gem 'gherkin'
  gem 'factory_girl'
  gem 'ruby-prof'
end
#===REFINERY END OF REQUIRED GEMS===

#===REQUIRED FOR REFINERY GEM INSTALL===
# Leave the gem below disabled (commented out) if you're not using the gem install method.
# gem 'refinerycms',    '= 0.9.7.8'
#===END OF REFINERY GEM INSTALL REQUIREMENTS===

# Bundle gems for certain environments:

# Specify your application's gem requirements here. See the examples below:
# gem 'refinerycms-news', '~> 0.9.8', :require => 'news'
# gem 'refinerycms-portfolio', '~> 0.9.7', :require => 'portfolio'
