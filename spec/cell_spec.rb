require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  let(:cell) {Cell.new("B4")}
  let(:cruiser) {Ship.new("Cruiser", 3)}

  describe "#iteration 1: create Cell object" do
    it "exists" do
      expect(cell).to be_a(Cell)
    end
  end

  describe "#coordinate" do
    it "has a coordinate" do
      expect(cell.coordinate).to eq("B4")
    end
  end

  describe "#ship" do
    it "starts with no ship" do
      expect(cell.ship).to eq(nil)
    end
  end

  describe "#empty?" do
    it "checks if cell is empty" do
      expect(cell.empty?).to eq(true)
    end
  end
  
  describe "#place_ship/1" do
  #/1 = 1 argument
    it "places ship" do
      cell.place_ship(cruiser)
      expect(cell.empty?).to eq(false)
    end
  end

  describe "#fired_upon?" do
    it "determines if cell has been fired upon" do
      cell.place_ship(cruiser)
      expect(cell.fired_upon?).to eq(false)
    end
  end

  describe "#fire_upon" do
    it "fires upon a cell" do
      # require 'pry'; binding.pry
      cell.place_ship(cruiser)
      cell.fire_upon
      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end
  end

  describe "#render" do
    let(:cell_1) {Cell.new("B4")}
    let(:cell_2) {Cell.new("C3")}

    it "renders a cell that hasn't been fired upon" do
      expect(cell_1.render).to eq(".") 
    end

    it "fires upon an empty cell and misses" do
      cell_1.fire_upon
      expect(cell_1.render).to eq("M") 
    end

    it "renders a new cell" do
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
    end

    it "renders a 'S' if cell holds ship and access is available" do
      cell_2.place_ship(cruiser)
      expect(cell_2.render(true)).to eq("S")
    end

    it "renders a 'H' if the cell has been fired upon, contains a ship (the shot was a hit)" do
      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
    end
  end
end












# > cruiser.sunk?
# # => false

# pry(main)> cruiser.hit

# pry(main)> cruiser.hit

# pry(main)> cruiser.sunk?
# # => true

# pry(main)> cell_2.render
# # => "X"