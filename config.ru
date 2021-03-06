require 'rubygems'
require 'bundler'

Bundler.require

require './recharge'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.js_compressor = Uglifier.new(:copyright => false)
  environment.css_compressor = YUI::CssCompressor.new
  use Rack::Deflater
  run environment
end

run Sinatra::Application