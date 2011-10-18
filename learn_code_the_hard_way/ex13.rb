# http://ruby.learncodethehardway.org/book/ex13.html

puts "What's my first argument? "
first = gets.chomp()
puts "What's my second argument? "
second = gets.chomp()
puts "What's my third argument? "
third = gets.chomp()

puts first + second + third

#first, second, third = ARGV

puts "The script is called: #{$0}"
puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"
