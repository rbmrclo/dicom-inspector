require 'json'
require 'compass'
require 'rubygems'
require 'shotgun'
require 'rack-cache'
require 'sinatra'
require 'sass'
require 'dicom'
require 'haml'
require 'mini_magick'
require 'mongoid'
require './app'

set :run, false
set :raise_errors, true
set :environment, :development

Mongoid.load!("mongoid.yml")

configure do
  # Compass
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))

  # Load lib
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| 
    require File.basename(lib, '.*') 
  }

  # Load resources
  Dir["resources/*.rb"].each {|file| load file }
end

map '/' do
  run App
end
