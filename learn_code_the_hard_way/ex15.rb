# http://ruby.learncodethehardway.org/book/ex15.html

#filename = ARGV.first

prompt = "> "
#txt = File.open(filename)

#puts "Here's your file: #{filename}"
#puts txt.read()

puts "Type the filename again:"
print prompt
file_again = STDIN.gets.chomp()
puts file_again

txt_again = File.open(file_again)

puts txt_again.read()

#txt.close()
txt_again.close()
