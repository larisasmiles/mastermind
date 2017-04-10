require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_start'
require './lib/mastermind'


class GameStartTest < Minitest::Test

  def test_if_game_exists
   game = Game_Start.new 
  
   assert_instance_of Game_Start, game

  end



end

