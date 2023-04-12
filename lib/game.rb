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

  def play_game
    main_menu
    place_cpu_ships
    place_human_ships
    game_over
    main_menu
  end
  
  
  
  def main_menu
  # def main_menu(input)
  welcome_screen
  play_quit_invalid_input
  end

  def place_cpu_ships
    place_cpu_cruiser
    place_cpu_submarine
  end

  def place_human_ships
    place_human_cruiser
    place_human_submarine
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
    else
      puts "Invalid input. Choose new coordinate."
      player_turn
    end
  end

  def cpu_turn
    cpu_input = @human.board.cells.keys.sample(1)
    if !@human.board.cells[cpu_input.join].fired_upon?
      @human.board.cells[cpu_input.join].fire_upon
      if @human.board.cells[cpu_input.join].render == "M"
        puts "My shot on #{cpu_input.join} was a MISS."
      elsif @human.board.cells[cpu_input.join].render == "H"
        puts "My shot on #{cpu_input.join} was a HIT."
      else
        @human.board.cells[cpu_input.join].render == "X"
        puts "My shot on #{cpu_input.join} sunk your battleship."
      end
    else
      cpu_turn
    end
  end

  def game_over
    until (@human_cruiser.sunk? && @human_submarine.sunk?) || (@cpu_cruiser.sunk? && @cpu_submarine.sunk?) do
      # display_boards
      sleep(1)
      player_turn
      sleep(2)
      if @cpu_cruiser.sunk? && @cpu_submarine.sunk?
        puts "NOOOOOOOOOO! You Win! Good job nerd!"
        break
      end
      cpu_turn
      sleep(1)
      if @human_cruiser.sunk? && @human_submarine.sunk?
        puts "Haha Loser! Game Over! Try again."
        break
      end
    end
  end
  
# @human_cruiser.sunk? && human_submarine.sunk? || @cpu_cruiser.sunk? && @cpu_submarine.sunk?
  
  # helper methods
  
  def welcome_screen
    puts '                          |  1  |  2  |  3  |  4  |
                        --|-----|-----|-----|-----|
                      A   |     |     |     |     |
                        --|-----|-----|-----|-----|
                      B   |     |     |     |     |
                        --|-----|-----|-----|-----|
                      C   |     |     |     |     |
                        --|-----|-----|-----|-----|
                      D   |     |     |     |     |
                        --|-----|-----|-----|-----| '

      puts "************************************************************"
      puts "Welcome to BATTLESHIP
      Enter p to play. Enter q to quit." 
      puts "============================================================"
  end

  def display_boards
    puts "====================COMPUTER BOARD===================="
    puts @cpu.board.render
    puts "====================PLAYER BOARD===================="
    puts @human.board.render(true)
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
          |  1  |  2  |  3  |  4  |
        --|-----|-----|-----|-----|
      A   |     |     |     |     |
        --|-----|-----|-----|-----|
      B   |     |     |     |     |
        --|-----|-----|-----|-----|
      C   |     |     |     |     |
        --|-----|-----|-----|-----|
      D   |     |     |     |     |
        --|-----|-----|-----|-----|
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

  def play_quit_invalid_input
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
end

# @human_cruiser.sunk? && human_submarine.sunk? || @cpu_cruiser.sunk? && @cpu_submarine.sunk?
# need loop for turns
# need loop for until cruiser+submarine are both sunk for either cpu or human

# 

#end game method- take in human and cpu ship instances.  
#once either (human_sub && human_cruiser) || (cpu_sub && cpu_cruiser) == sink
#puts "game over" 
#if human_sub && human_cruiser.sink == true puts "you lose"
#if cpu_sub && cpu_cruiser.sink == true puts "you win
#return user back to main menu