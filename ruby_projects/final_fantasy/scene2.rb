### FINAL FANTASY ###

class Scene2

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def prompt()
    print "\nPress Enter to continue."
    @continue = gets.chomp()
    if @continue != "exit"
      print "\nFF7>> ===================================================================================\n\n"
    else
      Process.exit(0)
    end
  end

  def play()
    puts <<-TEXT
Scene 2
- Escape From Mako Reactor 7 -
#{@name}, Barret, Biggs, Wedge, and Jessie are in a dark tunnel littered
with debris and broken metal.

Biggs >> That should keep the planet going... at least a little longer.
TEXT
  prompt
  puts "Wedge >> Yeah."
  prompt
  puts "Barret >> ..........."
  prompt
  puts "Jessie plants an explosive against a pile of debris blocking their exit.

Jessie >> OK! Now everyone get back."
  prompt
  puts <<-TEXT
You all stand back and a wall explodes, opening a way to a courtyard. Wedge's
butt seems to be on fire.

Barret >> All right, now let's get out of here.
Rendez-vous at Sector 8 station! Split up and get on the train!
TEXT
  prompt
  puts "They all exit except Barret and #{@name}.

#{@name} >> H, hey!"
  prompt
  puts "Barret >> It it's about your money save it 'till we're back at the hideout."
  prompt
  puts "Barret exist. #{@name} goes after him into the streets of Midgar."
  end

end
