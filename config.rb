##############################
# Load data
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each{ |file| require file }
#Navigation.load_all(data.navigation)

#activate :fjords do |config|
  #config.username = ""
  #config.password = ""
  #config.domain = "site.example.com"
#end


##############################
# Helpers
require 'config/routes'
require 'config/helpers'
require 'config/icon_helper'
require 'haml_coffee_assets'
require 'builder'

helpers do
  include RouteHelpers
  include ApplicationHelpers
  include IconHelper
end

##############################
# Initalise

# Assumes the file source/about/template.html.erb exists
#demo_files = Dir['source/images/demo/*']
#demo_files.map { |f| f.split('/') }
  #["tom", "dick", "harry"].each do |name|
#demo_files.each do |name|
#  proxy "/#{name}.html", "/demo.html", :locals => { :name => name }
#end

demo_files = Dir['source/images/demo/*']
demo_files.map { |f| f.split('/') }

demo_files.each do |l|
  link = l.gsub('source/images/demo','').gsub(/\.(png|jpg)/,'').gsub('/','')
  proxy "/#{link}", "/demo.html", :locals => { :src => link }
end




# Markdown config
module Haml::Filters::Markdown
  include Haml::Filters::Base
  #lazy_require "redcarpet"
  require 'redcarpet'

  def render(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text)
  end
end

# Middleman Navigation
activate :navigation

# Livereload
activate :livereload

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Activate google-analytics extension
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-XXXXXXX-X'
end

##############################
# Pages
page "*", :layout => "application"


##############################
# Dynamically Generated Pages
activate :directory_indexes  #Removes .html from file



##############################
## Settings
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true,
               :autolink => true, 
               :smartypants => true

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :sprockets

set :build_dir, 'www'

# Development-specific configuration
configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = false
  end
end


# Build-specific configuration
configure :build do

  # Clean 'Build' folder clean
  ignore "/javascripts/application/*"
  ignore "/javascripts/vendor/lib/*"
  ignore "/stylesheets/vendor/*"
  ignore "/vendor/components/*"
  ignore "*.rb"

  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster

  # Activate google-analytics extension
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-XXXXXXX-X'
  end
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  @bower_assets_path = File.join "#{root}", @bower_config["directory"]
  sprockets.append_path 'source/vendor'
  sprockets.append_path @bower_assets_path
  sprockets.append_path 'vendor/javascripts'
  sprockets.append_path 'vendor/stylesheets'
  sprockets.append_path 'source/stylesheets/fonts'
  sprockets.append_path 'source/templates'
  sprockets.append_path 'source/javascripts/backbone/templates'
  sprockets.append_path File.dirname(HamlCoffeeAssets.helpers_path)
  #sprockets.import_asset 'source/robots.txt'
end


