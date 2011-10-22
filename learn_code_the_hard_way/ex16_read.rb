# 2. Write a script similar to the last exercise
# that uses read and argv to read the file you just created.

prompt = "> "

puts "What file do you want to read?"
print prompt
filename = STDIN.gets.chomp()

puts filename

target = File.open(filename)

puts target.read()

target.close()
