# http://ruby.learncodethehardway.org/book/ex41.html

class Map

  def initialize
    @quips = [
      "You died. You kinda suck at this.",
      "Nice job, you died ...jackass.",
      "Such a loser.",
      "I have a small puppy that's better at this."
    ]
  end

  def prompt()
    print "> "
  end

  def death()
    puts @quips[rand(@quips.length())]
    Process.exit(1)
  end

  def central_corridor()
    puts <<-CENTRAL_CORRIDOR
  The Gothons of Planet Percal #25 have invaded your ship and destroyed
  your entire crew. You are the last surviving member and your last
  mission is to get the neutron destruct bomb from the Weapons Armory,
  put it in the bridge, and blow the ship up after getting into an
  escape pod.
  \n
  You're running down the central corridor to the Weapons Armory when
  a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume
  flowing around his hate filled body. He's blocking the door to the
  Armory and about to pull a weapon to blast you.
    CENTRAL_CORRIDOR

    prompt()
    action = gets.chomp()

    if action == "shoot!"
      puts <<-SHOOT
  Quick on the draw you yank out your blaster and fire it at the Gothon.
  His clown costume is flowing and moving around his body, which throws
  off your aim. Your laser hits his costume but misses him entirely. This
  completely ruins his brand new costume his moether bought him, which
  makes him fly into an insane rage and blast you repeatedly in the face until
  you are dead. Then he eats you.
      SHOOT
      return :death

    elsif action == "dodge!"
      puts <<-DODGE
  Like a world class boxer you dodge, weave, slip and slide right
  as the Gothon's blaster cranks a laser past your head.
  In the middle of your artful dodge your foot slips and you
  bang your head on the metal wall and pass out.
  You wake up shortly after only to die as the Gothon stomps on
  your head and eats you.
      DODGE
      return :death

    elsif action == "tell a joke"
      puts <<-TELL_A_JOKE
  Lucky for you they made you learn Gothon insults in the academy.
  You tell the one Gothon joke you know:
  Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhrf.
  The Gothon stops, tries not to laugh, then bursts out laughing and can't move.
  While he's laughing you run up and shoot him square in the head
  putting him down, then jump through the Weapon Armory door.
      TELL_A_JOKE
      return :laser_weapon_armory

    else
      puts "DOES NOT COMPUTE!"
      return :central_corridor
    end
  end

  def laser_weapon_armory()
    puts <<-LASER_WEAPON_ARMORY
  You do a dive roll into the Weapon Armory, crouch and scan the room
  for more Gothons that might be hiding. It's dead quiet, too quiet.
  You stand up and run to the far side of the room and find the
  neutron bomb in its container. There's a keypad lock on the box
  and you need the code to get the bomb out. If you get the code
  wrong 10 times then the lock closes forever and you can't"
  get the bomb. The code is 3 digits.
    LASER_WEAPON_ARMORY
    code = "%s%s%s" % [rand(9)+1, rand(9)+1, rand(9)+1]

    puts "Ready to input code?"
    ready = gets.chomp()
    if ready == "cheat"
      puts code
    else
      puts "Type a 3 digit code:"
    end

    print "[keypad]> "
    guess = gets.chomp()
    guesses = 0

    while guess != code and guesses < 10
      puts "BZZZZEDDD!"
      guesses += 1
      print "[keypad]> "
      guess = gets.chomp()
    end

    if guess == code
      puts <<-RIGHT_CODE
  The container clicks open and the seal breaks, letting gas out.
  You grab the neutron bomb and run as fast as you can to the
  bridge where you must place it in the right spot.
      RIGHT_CODE
      return :the_bridge
    else
      puts <<-WRONG_CODE
  The lock buzzes one last time and then you hear a sickening
  melting sound as the mechanism is fused together.
  You decide to sit there, and finally the Gothons blow up the
  ship from their ship and you die.
      WRONG_CODE
      return :death
    end
  end

  def the_bridge()

    puts <<-THE_BRIDGE
  You burst onto the Bridge with the neutron destruct bomb
  under your arm and surprise the 5 Gothons who are trying to
  take control of the ship. Each of them has an even uglier
  clown costume than the last. They haven't pulled their
  weapons out yet, as they see the active bomb under your
  arm and don't want to set it off.
    THE_BRIDGE

    prompt()
    action = gets.chomp()

    if action == "throw the bomb"
      puts <<-THROW_THE_BOMB
  In a panic you throw the bomb at the group of Gothons
  and make a leap for the door. Right as you drop it a
  Gothon shoots you right in the back killing you.
  As you die you see another Gothon frantically try to disarm
  the bomb. You die knowing they will probably blow up when
  it goes off.
      THROW_THE_BOMB
      return :death

    elsif action == "slowly place the bomb"
      puts <<-SLOWLY_PLACE_THE_BOMB
  You point your blaster at the bomb under your arm
  and the Gothons put their hands up and start to sweat.
  You inch backward to the door, open it, and then carefully
  place the bomb on the floor, pointing your blaster at it.
  You then jump back through the door, punch the close button
  and blast the lock so the Gothons can't get out.
  Now that the bomb is placed you run to the escape pod to
  get off this tin can.
      SLOWLY_PLACE_THE_BOMB
      return :escape_pod
    else
      puts "DOES NOT COMPUTE!"
      return :the_bridge
    end
  end

  def escape_pod()
    puts <<-ESCAPE_POD
  You rush through the ship desperately trying to make it to
  the escape pod before the whole ship explodes. It seems like
  hardly any Gothons are on the ship, so your run is clear of
  interference. You get to the chamber with the escape pods, and
  now need to pick one to take. Some of them could be damaged
  but you don't have time to look. There's 5 pods, which one
  do you take?
    ESCAPE_POD

    good_pod = rand(5)+1

    puts "Ready to choose your pod?"
    ready_pod = gets.chomp()
    
    if ready_pod == "cheat"
      puts good_pod
    else
      puts "Type Pod Number:"
    end

    print "[pod #]> "
    guess = gets.chomp()

    if guess.to_i != good_pod
      puts <<-WRONG_POD
  You jump into pod #{guess} and hit the eject button.
  The pod escapes out into the void of space, then
  implodes as the hull ruptures, crushing your body
  into jam jelly.
      WRONG_POD
      return :death
    else
      puts <<-RIGHT_POD
  You jump into pod #{guess} and hit the eject button.
  The pod easily slides out into space heading to
  the planet below. As it flies to the planet, you look
  back and see your ship implode then explode like a
  bright star, taking out the Gothon ship at the same
  time. You won! However you still have one more room
  to go...
      RIGHT_POD
      return :last_room
    end
  end

  def last_room
    a = rand(10)+1
    b = rand(10)+1

    puts <<-LAST_ROOM
  This is the last room. All you need to do is answer
  the following question correctly:
  What is #{a} + #{b}?
    LAST_ROOM

    sum = gets.chomp()
    if sum.to_i == a + b
      puts "You FINALLY WON!"
      Process.exit(0)
    else
      return :death
    end
  end

end

class Engine < Map

  def initialize(start)
    @start = start
  end

  def play
    puts "@start => " + @start.inspect
    next_room = @start

    while true
      puts "\n--------"
      room = method(next_room)
      next_room = room.call
    end
  end

end

a_game = Engine.new(:central_corridor)
a_game.play
