require 'sinatra'

path = File.expand_path "../", __FILE__
require "#{path}/app.rb"

run Sinatra::Application