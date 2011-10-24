# http://ruby.learncodethehardway.org/book/ex17.html

# See how short you can make the script. I could make this 1 line long.
File.open(ARGV.last, 'w').write(File.read(ARGV.first))

#from_file, to_file = ARGV
#script = $0
#
## No need to ask you before doing the copy
##puts "Copying from #{from_file} to #{to_file}"
#
## We could do these two on one line too, how?
#input = File.open(from_file); indata = input.read()
#
#puts "The input file is #{indata.length} bytes long."
#
#puts "Does the output file exist? #{File.exists? to_file}"
#puts "Ready, hit RETURN to continue, CTRL-C to abort."
#STDIN.gets
#
#output = File.open(to_file, 'w')
#output.write(indata)
#
#puts "Alright, all done."
#
#output.close()
#indata.close()
