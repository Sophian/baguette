### FINAL FANTASY ###

class Scene2

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
    puts "This is Scene 2"
    puts "I need to find a way to put this in its own class
    and have this file link to that other class' method."
  end

end
