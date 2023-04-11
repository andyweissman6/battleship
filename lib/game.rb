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
end