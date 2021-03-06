# encoding: utf-8
require File.expand_path("../lib/guard/relaunch", __FILE__)

Gem::Specification.new do |s|
  s.name         = "guard-relaunch"
  s.author       = "Francesco 'makevoid' Canessa"
  s.email        = "makevoid@gmail.com"
  s.summary      = "Guard gem for relaunching processes"
  s.homepage     = "http://github.com/makevoid/guard-relaunch"
  s.version      = Guard::Relaunch::VERSION

  s.description  = <<-DESC
    Guard::Relaunch automatically manages processes, killing and relaunching them.
  DESC

  s.add_runtime_dependency 'guard', '~> 2.10', '>= 2.10.2'

  s.files        = %w(Readme.md LICENSE)
  s.files       += Dir["{lib}/**/*"]
end
