require './lib/game' 
require './lib/player'
require './lib/board'
require './lib/cell'
require './lib/ship'

cpu_player = Player.new
human_player = Player.new
game = Game.new(cpu_player, human_player)

puts game.play_game

