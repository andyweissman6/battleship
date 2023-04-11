require 'spec_helper'


RSpec.describe Game do
  describe "Iteration 3: set up game" do
    it "exists" do
      cpu_board = Board.new
      human_board = Board.new
      cpu_cruiser = Ship.new("Cruiser", 3)
      cpu_submarine = Ship.new("Submarine", 2)
      human_cruiser = Ship.new("Cruiser", 3)
      human_submarine = Ship.new("Submarine", 2)
      human_player = Player.new
      cpu_player = Player.new
      game = Game.new(cpu_player, human_player)
      

      expect(cpu_board).to be_a(Board)
      expect(human_board).to be_a(Board)
      expect(cpu_cruiser).to be_a(Ship)
      expect(human_cruiser).to be_a(Ship)
      expect(cpu_submarine).to be_a(Ship)
      expect(human_submarine).to be_a(Ship)
      expect(human_player).to be_a(Player)
      expect(cpu_player).to be_a(Player)
      expect(game).to be_a(Game)
    end
  end
end