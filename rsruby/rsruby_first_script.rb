# Using R from Ruby with RSRuby
## http://rubyforscientificresearch.blogspot.com/2009/04/getting-started-with-r.html

require 'rubygems'
puts 'rubygems installed'
require 'rsruby'
puts 'rsruby installed'

r = RSRuby.instance
puts 'RSRuby instance called'

# Construct data to plot, graph of x vs sqrt(x)
xs = 10.times.collect {|i| i}
ys = xs.collect {|x| r.sqrt(x)}
puts 'Data constructed...'

r.png("example.png")  # tell R we will create png file
puts 'png prepared...'
r.plot(:x => xs,
       :y => ys,           # (x, y) coordinates to plot
       :type => "o",       # draw a line through points
       :col  => "blue",    # color the line blue
       :main => "Plot of x against sqrt(x)",    # add title to graph
       :xlab => "x", :ylab => "sqrt(x)")        # add labels to axes
puts 'plot initialized'

r.eval_R("dev.off()")     # finish the plotting
puts 'closed device.'
