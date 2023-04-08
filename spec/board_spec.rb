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

  describe "#valid_coordinate?" do
    it "checks for valid coordinates" do
      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  end
end

# pry(main)> board.valid_coordinate?("A1")
# # => true

# pry(main)> board.valid_coordinate?("D4")
# # => true

# pry(main)> board.valid_coordinate?("A5")
# # => false

# pry(main)> board.valid_coordinate?("E1")
# # => false

# pry(main)> board.valid_coordinate?("A22")
# # => false