require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  describe "#iteration 1: create Ship object" do
    it "exists" do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser).to be_a(Ship)
    end
  end
  
  describe "#name" do
    it "has a name" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.name).to eq("Cruiser")
    end
  end

  describe "#length" do
    it "has a length" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.length).to eq(3)
    end
  end
    
  describe "#health" do
    it "has health" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.health).to eq(3)
    end
  end

  describe "#sunk?" do
    it "can be sunk" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.sunk?).to eq(false)
    end
  end

  describe "#hit" do
    it "can get hit and lose health" do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
      expect(cruiser.health).to eq(2)
    end
    
    it "hitting 3 times sinks ship" do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit  
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
    end
  end
end




























