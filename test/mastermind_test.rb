require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind.rb'

class MastermindTest < Minitest::Test

  def test_if_game_exists
    mastermind = Mastermind.new 

    assert_instance_of Mastermind, mastermind
  end

  def test_if_has_player_guess
    mastermind = Mastermind.new

    refute_nil mastermind.player_guess
  end

  def test_if_guess_is_wrong_length
    mastermind = Mastermind.new
    test_guess = ["r", "r"]
    h = mastermind.wrong_length(test_guess)

    assert_equal mastermind.too_short, h
  end

  def test_if_guess_is_wrong_length
    mastermind = Mastermind.new
    test_guess = ["r", "r"]
    h = mastermind.wrong_length(test_guess)

    assert_equal mastermind.too_long, h
  end
end

