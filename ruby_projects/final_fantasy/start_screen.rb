### FINAL FANTASY ###

require 'scene1'

class StartScreen < Scene1

  def prompt()
    print "\nPress Enter to continue."
    @continue = gets.chomp()
    if @continue != "exit"
      print "\nFF7>> ===================================================================================\n\n"
    else
      Process.exit(0)
    end
  end
  
  def new_game()
    puts "NEW GAME"
    puts "Continue?"
    puts "\nPlease Type \"New Game\" or \"Continue\".\n\n"
    print "FF7>> "
    @action = gets.chomp()

    if @action == "New Game"
      next_scene = Scene1.new
      next_scene.play
      #return :scene1
    elsif @action == "Continue"
      return :continue
    elsif @action == "exit"
      Process.exit(0)
    else
      puts "クエッ！"
      return :start_screen
    end
  end

  def continue()
    puts "Save functionality soon to come..."
    #puts "Please select save state."
    Process.exit(0)
  end

end
