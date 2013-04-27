# To launch the spec:

# ruby run.rb; guard

# then after you edit a ruby file, your process will be relaunched


puts `cd ..; gem build guard-relaunch.gemspec`
puts `cd ..; gem install guard-relaunch-0.0.1.gem --no-ri --no-rdoc`
