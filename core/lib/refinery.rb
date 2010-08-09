require 'active_support/dependencies'

module RefineryStaticAssetsEngine
  class Engine < Rails::Engine
    initializer "static assets" do |app|
      app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
    end
  end
end

module Refinery

  autoload :Plugin,  'refinery/plugin'
  autoload :Plugins, 'refinery/plugins'
  autoload :Activity, 'refinery/activity'

  class << self
    attr_accessor :is_a_gem, :root, :s3_backend, :base_cache_key
    def is_a_gem
      @is_a_gem ||= false
    end

    def root
      @root ||= Pathname.new(File.dirname(__FILE__).split("vendor").first.to_s)
    end

    def s3_backend
      @s3_backend ||= false
    end

    def base_cache_key
      @base_cache_key ||= "refinery"
    end

    def version
      ::Refinery::Version.to_s
    end
  end

  class Version
    class << self
      attr_reader :major, :minor, :tiny, :build
    end

    @major = 0
    @minor = 9
    @tiny  = 7
    @build = 11

    def self.to_s
      [@major, @minor, @tiny, @build].compact.join('.')
    end
  end
end

require 'acts_as_indexed'
require 'friendly_id'
require 'truncate_html'
require 'will_paginate'

Refinery::Plugin.register do |plugin|
  plugin.title = "Refinery"
  plugin.name = "refinery_core"
  plugin.description = "Core refinery plugin"
  plugin.version = 1.0
  plugin.hide_from_menu = true
  plugin.always_allow_access = true
  plugin.menu_match = /(refinery|admin)\/(refinery_core|base)$/
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  # plugin.directory = directory
end
require_dependency 'refinery/form_helpers'
require_dependency 'refinery/base_presenter'

RefineryEngine.class_eval do
  config.autoload_paths += %W( #{config.root}/lib )

  initializer :add_catch_all_routes do |app|
    app.routes_reloader.paths << File.expand_path('../refinery/catch_all_routes.rb', __FILE__)
  end
end

[ Refinery.root.join("vendor", "plugins", "*", "app", "presenters").to_s,
  Refinery.root.join("app", "presenters").to_s
].uniq.each do |path|
  Dir[path].each do |presenters_path|
    $LOAD_PATH << presenters_path
    ::ActiveSupport::Dependencies.load_paths << presenters_path
  end
end
