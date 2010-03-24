require 'active_support/inflector'
require 'yaml'

def self.load_yaml_fixtures(file)
  YAML.load_file(File.expand_path("../fixtures/#{file}.yml", __FILE__))
end

%w(
  images
  inquiries
  page_parts
  pages
  refinery_settings
  resources
  user_plugins
  users
).each do |f|
  y = load_yaml_fixtures(f)
  #instance_variable_set("@#{f}", ))
  clazz = f.classify.constantize
  y.each do |k, v|
    clazz.fixture(k.to_sym) { v }
  end
end
