# http://ruby.learncodethehardway.org/book/ex16.html

# Assign the command's first argument as the variable filename
filename = ARGV.first
# Assign the running script to the variable script
script = $0

# Puts warning before ERASING filename
puts "We're going to erase #{filename}."
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

print "? "
# Let use input CTRL-C or RETURN
STDIN.gets

# Open the file with variable target with writing permissions
puts "Opening the file..."
target = File.open(filename, 'w')

# OPEN is the same as NEW so NO NEED TO TRUNCATE
# Truncate/Erase the file via target
#puts "Truncating the file. Goodbye!"
#target.truncate(filename.size)

# Assigne 3 lines input by the user
puts "Now I'm going to ask you for three lines."

print "line 1: "; line1 = STDIN.gets.chomp()
print "line 2: "; line2 = STDIN.gets.chomp()
print "line 3: "; line3 = STDIN.gets.chomp()

# Write the 3 lines to the file with only one target.write
# by using strings, formats and escapes.
puts "I'm going to write these to the file."

target.write("#{line1}\n#{line2}\n#{line3}\n")

# Close the file via target
puts "And finally, we close it."
target.close()
