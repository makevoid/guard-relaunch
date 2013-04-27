# Guard::Relaunch

Relaunches the command everytime a file is saved, useful to relaunch your program/app server, especially if it's fast to launch :)

## Install

Make sure you have [guard](http://github.com/guard/guard) installed.

Install the gem with:

    gem install guard-relaunch

Or add it to your Gemfile:

    gem 'guard-relaunch'

And then add a basic setup to your Guardfile:

    guard init relaunch


## Usage


``` ruby
# This will concatenate the javascript files a.js and b.js in public/js to all.js
guard :relaunch, command: "rackup"
```