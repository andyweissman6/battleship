class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
              }
              
    @valid_cruiser = [["A1", "B1", "C1"], 
                      ["A2", "B2", "C2"], 
                      ["A3", "B3", "C3"], 
                      ["A4", "B4", "C4"], 
                      ["D1", "D2", "D3"],
                      ["B1", "C1", "D1"],
                      ["B3", "C3", "D3"],
                      ["B2", "C2", "D2"],
                      ["B4", "C4", "D4"],
                      ["A1", "A2", "A3"],
                      ["B1", "B2", "B3"],
                      ["C1", "C2", "C3"],
                      ["A2", "A3", "A4"],
                      ["B2", "B3", "B4"],
                      ["C2", "C3", "C4"],
                      ["D2", "D3", "D4"]]
    
  @valid_submarine =   [["A1", "A2"], 
                        ["A2", "A3"],
                        ["A3", "A4"],
                        ["B1", "B2"],
                        ["B2", "B3"],
                        ["B3", "B4"],
                        ["C1", "C2"],
                        ["C2", "C3"],
                        ["C3", "C4"],
                        ["D1", "D2"],
                        ["D2", "D3"],
                        ["D3", "D4"],
                        ["A1", "B1"],
                        ["B1", "C1"],
                        ["C1", "D1"],
                        ["A2", "B2"],
                        ["B2", "C2"],
                        ["C2", "D2"],
                        ["A3", "B3"],
                        ["B3", "C3"],
                        ["C3", "D3"],
                        ["A4", "B4"],
                        ["B4", "C4"],
                        ["C4", "D4"]]
                  
  end

  def valid_coordinate?(coordinate)
    cells.include?(coordinate)
  end
  
  
  def valid_placement?(ship, coordinates)
    length_equals_ship(ship, coordinates) && 
    consecutive_coordinates(ship, coordinates) && 
    overlapping?(ship, coordinates)
  end
    
    
  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) && all_valid_coordinates?(ship, coordinates)
      coordinates.each { |coordinate| cells[coordinate].place_ship(ship) } 
    end
  end

  def render(access = false)
    if access == true
        "+---+---+---+---+---+\n" +
        "| + | 1 | 2 | 3 | 4 |\n" +
            "+---+---+---+---+---+\n" +
        "| A | #{cells["A1"].render(access)} | #{cells["A2"].render(access)} | #{cells["A3"].render(access)} | #{cells["A4"].render(access)} |\n" +
            "+---+---+---+---+---+\n" +
        "| B | #{cells["B1"].render(access)} | #{cells["B2"].render(access)} | #{cells["B3"].render(access)} | #{cells["B4"].render(access)} |\n" +
            "+---+---+---+---+---+\n" +
        "| C | #{cells["C1"].render(access)} | #{cells["C2"].render(access)} | #{cells["C3"].render(access)} | #{cells["C4"].render(access)} |\n" +
            "+---+---+---+---+---+\n" +
        "| D | #{cells["D1"].render(access)} | #{cells["D2"].render(access)} | #{cells["D3"].render(access)} | #{cells["D4"].render(access)} |\n" +
            "+---+---+---+---+---+\n"
    else
      "+---+---+---+---+---+\n" +
      "| + | 1 | 2 | 3 | 4 |\n" +
          "+---+---+---+---+---+\n" +
      "| A | #{cells["A1"].render} | #{cells["A2"].render} | #{cells["A3"].render} | #{cells["A4"].render} |\n" +
          "+---+---+---+---+---+\n" +
      "| B | #{cells["B1"].render} | #{cells["B2"].render} | #{cells["B3"].render} | #{cells["B4"].render} |\n" +
          "+---+---+---+---+---+\n" +
      "| C | #{cells["C1"].render} | #{cells["C2"].render} | #{cells["C3"].render} | #{cells["C4"].render} |\n" +
          "+---+---+---+---+---+\n" +
      "| D | #{cells["D1"].render} | #{cells["D2"].render} | #{cells["D3"].render} | #{cells["D4"].render} |\n" +
          "+---+---+---+---+---+\n"
    end
  end

  #helper method 

  def length_equals_ship(ship, coordinates)
    coordinates.length == ship.length
  end

  def consecutive_coordinates(ship, coordinates)
    @valid_cruiser.include?(coordinates) || @valid_submarine.include?(coordinates)
  end

  def all_valid_coordinates?(ship, coordinates)
    coordinates.all? { |coordinate| valid_coordinate?(coordinate) }
  end

  def overlapping?(ship, coordinates)
    coordinates.all? { |coordinate| cells[coordinate].empty? } 
  end 
end