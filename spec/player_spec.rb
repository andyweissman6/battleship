require 'spec_helper'

RSpec.describe Player do
  it "exists" do
    cpu = Player.new
    human = Player.new

    expect(cpu).to be_a(Player)
    expect(human).to be_a(Player)
  end

  it "each player has board" do
    cpu = Player.new
    human = Player.new

    expect(cpu.board.cells.keys).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
    expect(human.board.cells.keys).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
  end
end