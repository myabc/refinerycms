#version = File.read(File.expand_path("../../REFINERY_VERSION", __FILE__)).strip

RAILS_VERSION = '3.0.0.rc'
DM_VERSION    = '~> 1.0.0'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'refinerycms-core'
  s.version     = '0.9.8'
  s.summary     = 'Core functionality for the Refinery CMS project.'
  s.required_ruby_version = '>= 1.8.7'

  s.files        = Dir['changelog.md', 'README', 'MIT-LICENSE', 'lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('activesupport',    RAILS_VERSION)
  s.add_dependency('actionmailer',     RAILS_VERSION)
  s.add_dependency('actionpack',       RAILS_VERSION)
  s.add_dependency('railties',         RAILS_VERSION)
  s.add_dependency('dm-rails',         DM_VERSION)
  s.add_dependency('dm-migrations',    DM_VERSION)
  s.add_dependency('dm-types',         DM_VERSION)
  s.add_dependency('dm-validations',   DM_VERSION)
  s.add_dependency('dm-constraints',   DM_VERSION)
  s.add_dependency('dm-transactions',  DM_VERSION)
  s.add_dependency('dm-aggregates',    DM_VERSION)
  s.add_dependency('dm-timestamps',    DM_VERSION)
  s.add_dependency('dm-observer',      DM_VERSION)
  s.add_dependency('dm-is-tree',       DM_VERSION)
  s.add_dependency('dm-ar-finders',    DM_VERSION)

  s.add_dependency('friendly_id',     '~> 3.0.6')
  s.add_dependency('friendly_id_datamapper', '~> 3.0.6')
  s.add_dependency('truncate_html',   '= 0.3.2')
  s.add_dependency('will_paginate',   '>= 3.0.pre2')
end
