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

    @valid_crusier = [["A1", "B1", "C1"], 
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
    coordinates.length == ship.length
  end
    
    

  

  #helper method 
  # def consecutive_coordinates?
  #   letters = "A".."D"
  #   nums = 1..4
  #   let_arr = letters.to_a
  #   nums_arr = nums.to_a
  #   letter = let_arr.each_cons(3).map { |let| let }
  #   number = nums_arr.each_cons(3).map { |num| num }
  #   require 'pry'; binding.pry

  #   # valid_coordinates = letter.each do |let| 
  #   #                       number.map do |nums|
                            

    
      
    
   
  # end
end