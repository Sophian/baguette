# http://ruby.learncodethehardway.org/book/ex30.html

people = 30
cars = 40
buses = 15

# Scenario:
## Take the cars, only if there are more cars than people.
if cars > people
  puts "We should take the cars."
elsif cars < people
  puts "We should not take the cars."
else
  puts "We can't decide."
end

# Scenario:
## Maybe take the bus, only if there are less buses than cars
if buses > cars
  puts "That's too many buses."
elsif buses < cars
  puts "Maybe we could take the buses."
else
  puts "We still can't decide."
end

# Scenario:
## Take the bus, only if there are more people than buses
## Stay home if there are more buses than people
if people > buses
  puts "Alright, let's just take the buses."
else
  puts "Fine, let's stay home then."
end
