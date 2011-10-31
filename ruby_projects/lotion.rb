# Trying to understand how procs work

def pit
  begin
    puts "It puts the lotion on its skin, else it gets the hose again."
    print "> "
    @action = gets.chomp()
  end while @action != "put lotion"
end

pit

puts "Hose got tucked in!"
Process.exit(0)
