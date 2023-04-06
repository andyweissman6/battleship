require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  describe "#iteration 1: create Ship object" do
    it "exists" do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser).to be_a(Ship)
    end

    it "has attributes" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
    end
  
  end
end




























# pry(main)> cruiser.name
# #=> "Cruiser"

# pry(main)> cruiser.length
# #=> 3

# pry(main)> cruiser.health
# #=> 3

# pry(main)> cruiser.sunk?
# #=> false

# pry(main)> cruiser.hit

# pry(main)> cruiser.health
# #=> 2

# pry(main)> cruiser.hit

# pry(main)> cruiser.health
# #=> 1

# pry(main)> cruiser.sunk?
# #=> false

# pry(main)> cruiser.hit

# pry(main)> cruiser.sunk?
# #=> true