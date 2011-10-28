# http://ruby.learncodethehardway.org/book/ex33.html

def exclusive_up_to_by(x, int)

  i = 0
  numbers = []

  while i < x
    puts "At the top i is #{i}"
    numbers.push(i)

    i += int
    puts "Numbers now: #{numbers}"
    puts "At the bottom i is #{i}"
  end

  puts "The numbers: "
  for num in numbers
    puts num
  end
end

exclusive_up_to_by(6, 1)
exclusive_up_to_by(6, 2)
exclusive_up_to_by(11, 1)
exclusive_up_to_by(11, 5)

def exclusive_up_to_by_for(x)

  i = 0
  numbers = []

  for i in (0...x)
    puts "At the top i is #{i}"
    numbers.push(i)

    puts "Numbers now: #{numbers}"
    puts "At the bottom i is #{i}"
  end

  puts "The numbers: "
  for num in numbers
    puts num
  end
end

exclusive_up_to_by_for(6)
exclusive_up_to_by_for(11)
