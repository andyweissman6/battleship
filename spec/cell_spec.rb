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


end





# pry(main)> cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0891238...>

# pry(main)> cell.place_ship(cruiser)

# pry(main)> cell.ship
# # => #<Ship:0x00007f84f0891238...>

# pry(main)> cell.empty?
# # => false