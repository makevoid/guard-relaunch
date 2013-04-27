# To launch the spec:

# ruby run.rb; guard

# then edit a file :)

puts `cd ..; gem build guard-relaunch.gemspec`
puts `cd ..; gem install guard-relaunch-0.0.1.gem`
