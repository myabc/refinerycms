source :rubygems

git 'git://github.com/rails/rails.git'

gem 'activesupport',     '~> 3.0.0.beta1', :require => 'active_support'
gem 'actionmailer',      '~> 3.0.0.beta1', :require => 'action_mailer'
gem 'actionpack',        '~> 3.0.0.beta1', :require => 'action_pack'
gem 'railties',          '~> 3.0.0.beta1', :require => 'rails'

gem 'data_objects',      '~> 0.10.1'
gem 'do_sqlite3',        '~> 0.10.1'
gem 'do_mysql',          '~> 0.10.1'

gem 'dm-core',           '~> 0.10.2', :git => 'git://github.com/datamapper/dm-core.git'

git "git://github.com/datamapper/dm-more.git" do
  gem 'dm-types',          '~> 0.10.2'
  gem 'dm-validations',    '~> 0.10.2'
  gem 'dm-constraints',    '~> 0.10.2'
  gem 'dm-aggregates',     '~> 0.10.2'
  gem 'dm-timestamps',     '~> 0.10.2'
  gem 'dm-migrations',     '~> 0.10.2'
  gem 'dm-observer',       '~> 0.10.2'
  gem 'dm-serializer',     '~> 0.10.2'
  gem 'dm-is-tree',        '~> 0.10.2'
  gem 'dm-sweatshop',      '~> 0.10.2'
end

git 'git://github.com/datamapper/dm-rails.git'

gem 'dm-rails', '~> 0.10.2'

# Specify your favourite web server (only one).
gem 'unicorn', :group => :development
#gem 'mongrel', :group => :development

# Deploy with Capistrano
# gem 'capistrano'

# If you are using s3 you probably want this gem:
# gem 'aws-s3'

#===REFINERY REQUIRED GEMS===
git 'git://github.com/rails/rails.git'
git 'git://github.com/stephencelis/authlogic.git'

gem 'rails',          '3.0.0.beta3'
gem 'rmagick',        '~> 2.13.1'
gem 'hpricot',        '~> 0.8'
gem 'authlogic',      '~> 2.1.3'
gem 'friendly_id',    '~> 3.0'
gem 'will_paginate',  '3.0.pre'
#===REFINERY END OF REQUIRED GEMS===

#===REQUIRED FOR REFINERY GEM INSTALL===
# Leave the gem below disabled (commented out) if you're not using the gem install method.
#gem 'refinerycms',    '= 0.9.7.dev'
#===END OF REFINERY GEM INSTALL REQUIREMENTS===

# Bundle gems for certain environments:
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
end

# Specify your application's gem requirements here. See the examples below:
# gem "refinerycms-news", "~> 0.9.7", :require => "news"
# gem "refinerycms-portfolio", "~> 0.9.3.8", :require => "portfolio"

