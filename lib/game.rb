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
    main_menu
  end
  
  
  
  
  def main_menu
    puts 'Welcome to BATTLESHIP
    Enter p to play. Enter q to quit.'
    
    input = gets.chomp
    if input == 'p'
      puts "Let's play"
    elsif input == 'q'
      puts "Quitter"
    else
      puts "Invalid input"
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

end