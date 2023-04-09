require './lib/board'
require './lib/cell' 
require './lib/ship'

RSpec.describe Board do
  let(:board) {Board.new}

  describe "#iteration 2: create Board object" do
    it "exists" do
      expect(board).to be_a(Board)
    end

    it "has a hash of cell coordinate names as keys; cell objects as values" do
      expect(board.cells).to be_a(Hash)
    end
  end

  describe "#valid_coordinate?/1" do
    it "checks for valid coordinates" do
      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe "#valid_placement?/2" do
    let(:cruiser) {Ship.new("Cruiser", 3)}
    let(:submarine) {Ship.new("Submarine", 2)}

    it "checks if number of coordinates in array is the same as the length of the cruiser" do
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    end

    it "checks if number of coordinates in array is the same as the length of the submarine" do
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
    end

    it "make sure the coordinates are consecutive" do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it "can't be diagonal" do
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it "final placement validation" do
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
      
      
    end
  end

  describe "#place/2" do
    let(:cruiser) {Ship.new("Cruiser", 3)}
    
    it "places a ship into cells on the board" do
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      cell_4 = board.cells["A4"]
      cell_1.ship 
      cell_2.ship 
      cell_3.ship 
      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cruiser)
      expect(cell_3.ship == cell_2.ship).to eq(true)
      expect(cell_1.ship == cell_3.ship).to eq(true)
      expect(cell_1.ship == cell_4.ship).to eq(false)
      require 'pry'; binding.pry
    end
  end



  ## add tests for helper methods in own describe block
end



# pry(main)> cell_1.ship
# # => #<Ship:0x00007fcb0e1ffa28...>

# pry(main)> cell_2.ship
# # => #<Ship:0x00007fcb0e1ffa28...>

# pry(main)> cell_3.ship
# # => #<Ship:0x00007fcb0e1ffa28...>

# pry(main)> cell_3.ship == cell_2.ship
# # => true