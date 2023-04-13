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
    loop do
      main_menu
      place_cpu_ships
      place_human_ships
      game_over
      puts "\n"
      puts "Do you want to play again? (y/n)"
      response = gets.chomp.downcase
      break unless response == "y"
    end
    puts "Thanks for playing!"
  end
  
  
  def main_menu
  welcome_screen
  play_quit_invalid_input
  end
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
      if @cpu.board.cells[human_input].render == "M".red
        puts "\n"
        puts "Your shot on #{human_input} was a MISS."
      elsif @cpu.board.cells[human_input].render == "H".green
        puts "\n"
        puts "Your shot on #{human_input} was a HIT."
      else
        @cpu.board.cells[human_input].render == "X"
        if @cpu_cruiser.sunk? 
          puts "\n"
          puts "Your shot on #{human_input} sunk my #{@cpu_cruiser.name}"
        else
          puts "\n"
          puts "Your shot on #{human_input} sunk my #{@cpu_submarine.name}"
        end
      end
    else
      puts "#{human_input} is an invalid input or has already been fired upon. Choose new coordinate."
      player_turn
    end
  end

  def cpu_turn
    cpu_input = @human.board.cells.keys.sample(1)
    if !@human.board.cells[cpu_input.join].fired_upon?
      @human.board.cells[cpu_input.join].fire_upon
      if @human.board.cells[cpu_input.join].render == "M".red
        puts "\n"
        puts "My shot on #{cpu_input.join} was a MISS."
      elsif @human.board.cells[cpu_input.join].render == "H".green
        puts "\n"
        puts "My shot on #{cpu_input.join} was a HIT."
      else
        @human.board.cells[cpu_input.join].render == "X"
        if @human_cruiser.sunk? 
          puts "\n"
          puts "My shot on #{cpu_input.join} sunk your #{@human_cruiser.name}"
        else
          puts "\n"
          puts "My shot on #{cpu_input.join} sunk your #{@human_submarine.name}"
        end
      end
    else
      cpu_turn
    end
  end

  def game_over
    until (@human_cruiser.sunk? && @human_submarine.sunk?) || (@cpu_cruiser.sunk? && @cpu_submarine.sunk?) do
      sleep(1)
      player_turn
      sleep(2)
      display_boards
      if @cpu_cruiser.sunk? && @cpu_submarine.sunk?
        puts "\n"
        puts "NOOOOOOOOOO! You Win! Good job nerd!"
        puts "GAME OVER! Play Again?"
        break
      end
      cpu_turn
      sleep(1)
      display_boards
      if @human_cruiser.sunk? && @human_submarine.sunk?
        puts "\n"
        puts "Haha Loser! I Win!"
        puts "GAME OVER! Play Again?"
        break
      end
    end
  end
  
  # helper methods
  
  def welcome_screen
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
    choose_coordinates = cpu.board.cells.keys.sample(3)
    if @cpu.board.valid_placement?(@cpu_cruiser, choose_coordinates)
      @cpu.board.place(@cpu_cruiser, choose_coordinates)
    else
      place_cpu_cruiser
    end
  end

  def place_cpu_submarine
    choose_coordinates = cpu.board.cells.keys.sample(2)
    if @cpu.board.valid_placement?(@cpu_submarine, choose_coordinates)
      @cpu.board.place(@cpu_submarine, choose_coordinates)
    else
      place_cpu_submarine
    end
  end

  def place_human_cruiser
    puts "\n"
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
      puts "\n"
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

