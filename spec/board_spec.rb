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

    xit "checks if number of coordinates in array is the same as the length of the cruiser" do
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    end

    xit "checks if number of coordinates in array is the same as the length of the submarine" do
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
    end

    it "make sure the coordinates are consecutive" do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)

    end
  end
end

# Next, make sure the coordinates are consecutive:

# pry(main)> board.valid_placement?(cruiser, ["A1", "A2", "A4"])
# # => false

# pry(main)> board.valid_placement?(submarine, ["A1", "C1"])
# # => false

# pry(main)> board.valid_placement?(cruiser, ["A3", "A2", "A1"])
# # => false

# pry(main)> board.valid_placement?(submarine, ["C1", "B1"])
# # => false
# Finally, coordinates can’t be diagonal:

# pry(main)> board.valid_placement?(cruiser, ["A1", "B2", "C3"])
# # => false

# pry(main)> board.valid_placement?(submarine, ["C2", "D3"])
# # => false
# If all the previous checks pass then the placement should be valid:

# pry(main)> board.valid_placement?(submarine, ["A1", "A2"])
# # => true

# pry(main)> board.valid_placement?(cruiser, ["B1", "C1", "D1"])
# # => true
