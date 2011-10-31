### FAP ###

def fap(n)
  x = n.to_i
  if x == 0
    puts "I jizzed in your pants!"
    puts "\n"
    Process.exit(0)
  elsif x == @jizz
    puts "... " + "Fap " * x
    puts "    jizz."
    puts "\n"
    Process.exit(0)
  elsif x > @jizz
    puts "... " + "Fap " * x
    puts "You're fapping too much man."
    puts "\n"
  else
    puts "... " + "Fap " * x
    puts "Fap away wanker!"
    puts "\n"
  end
end

def prompt
  puts
  puts "Fap the right amount of times"
  print "> "
  @n = gets.chomp
end

@jizz = rand(10)+1

begin
  prompt
  if @n == "cheat"
    puts "You cheating wanker, fap #{@jizz} times and get it done with, oh jeethuth!"
    prompt
    fap(@n)
  else
    fap(@n)
  end
end until (@n == @jizz || @n == 0)
