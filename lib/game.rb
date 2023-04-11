class Game
  attr_reader :cpu, :human
  def initialize(cpu, human)
    @cpu = cpu
    @human = human
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_submarine = Ship.new("Submarine", 2)
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    
  end

  def start_game
    main_menu
    place_cpu_submarine
    place_cpu_cruiser
    place_human_cruiser
    place_human_submarine
    player_turn
    main_menu
  end
  
  
  
  def main_menu
  # def main_menu(input)
  # require 'pry'; binding.pry
    puts 'Welcome to BATTLESHIP
    Enter p to play. Enter q to quit.' 
    input = gets.chomp
    if input == 'p'
      puts "Let's play"
    elsif input == 'q'
      puts "Quitter"
    else
      puts "Invalid input"
      input = gets.chomp
      main_menu
    end
  end

  def place_cpu_cruiser
    @cpu_crusier 
    choose_coordinates = cpu.board.cells.keys.sample(3)
    if @cpu.board.valid_placement?(@cpu_cruiser, choose_coordinates)
      @cpu.board.place(@cpu_cruiser, choose_coordinates)
    else
      place_cpu_cruiser
    end
  end

  def place_cpu_submarine
    @cpu_submarine
    choose_coordinates = cpu.board.cells.keys.sample(2)
    if @cpu.board.valid_placement?(@cpu_submarine, choose_coordinates)
      @cpu.board.place(@cpu_submarine, choose_coordinates)
    else
      place_cpu_submarine
    end
  end

  def place_human_cruiser
    puts "I have laid out my ships on the grid. You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long.
      1 2 3 4
    A . . . .
    B . . . .
    C . . . .
    D . . . .
    Enter the squares for the Cruiser (3 spaces):
    >"
    @human_cruiser
    human_input = gets.chomp.upcase.split
    if @human.board.valid_placement?(@human_cruiser, human_input)
      @human.board.place(@human_cruiser, human_input)
      puts @human.board.render(true)
    else
      puts "Invalid input. Choose new placement."
      place_human_cruiser
    end
  end
  
  def place_human_submarine
    puts "Enter the squares for the Submarine (2 spaces): 
    >"
    @human_submarine
    human_input = gets.chomp.upcase.split
    if @human.board.valid_placement?(@human_submarine, human_input)
      @human.board.place(@human_submarine, human_input)
      puts @human.board.render(true)
    else
      puts "Invalid input. Choose new placement."
      place_human_submarine
    end
  end

  def player_turn
    display_boards
    puts "Enter the coordinate for your shot:
    >"
    human_input = gets.chomp.upcase
    if @cpu.board.valid_coordinate?(human_input) && !@cpu.board.cells[human_input].fired_upon?
      @cpu.board.cells[human_input].fire_upon
      if @cpu.board.cells[human_input].render == "M"
        puts "Your shot on #{human_input} was a MISS."
      elsif @cpu.board.cells[human_input].render == "H"
        puts "Your shot on #{human_input} was a HIT."
      else
        @cpu.board.cells[human_input].render == "X"
        puts "Your shot on #{human_input} sunk my battleship."
      end
      puts display_boards
    else
      puts "Invalid input. Choose new coordinate."
      player_turn
    end
  end
  
  # helper methods

  def display_boards
    puts "====================COMPUTER BOARD===================="
    puts @cpu.board.render
    puts "====================PLAYER BOARD===================="
    puts @human.board.render(true)
  end



end

# human cruiser place: #print "ihave laid my ships your turn, explanation of ships and to lay out ships, enter cells for cruiser"
        #print unrendered board, "enter the squares for cruiser" as example, write code for human input and place human cruiser. needs conditionals for invalid inputs
        #render human user board with placed cruiser. render(true)
        #valid_placement?(ship, coordinates)
#human submarine place:
              #write code for humain input for submarine. needs conditionals for invalid inputs
              #render human user board with placed ships render(true)
              #valid_placement?(ship, coordinates)
    
    #turn: User board is displayed showing hits, misses, sunken ships, and ships
    # -use render(true) to render human user board w/ place_ships showing

    # Computer board is displayed showing hits, misses, and sunken ships
    # use render (no access). Before first turn will display empty board

    # Computer chooses a random shot
    # - valid_cordinate?(ship, coordinates)

    # Computer does not fire on the same spot twice
    # - if cordinate already called once, it will not be called again. Conditiional?
    # - valid_cordinate?(ship, coordinates)

    # User can choose a valid coordinate to fire on
    # - create code for human input

    # Entering invalid coordinate prompts user to enter valid coordinate
    # - valid_cordinate?(ship, coordinates). Conditional/invalid?

    # Both computer and player shots are reported as a hit, sink, or miss
    # "You missed", "I missed", or "You hit"....

    # User is informed when they have already fired on a coordinate
    # - valid_cordinate?(ship, coordinates). Conditional/invalid?

    # Board is updated after a turn
    # - render board w/ hits, misses, sunk after each turn
