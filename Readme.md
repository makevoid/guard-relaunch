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

normal relaunch, kills the pid

``` ruby
guard :relaunch, command: "rackup -p 3000", watch: /\.rb/
```

custom relaunch, define a kill command

``` ruby
guard :relaunch, command: "rackup -p 3000", kill_command: "", watch: /\.rb/
```