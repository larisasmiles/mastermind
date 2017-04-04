require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require './lib/repl'
require "pry"

class MastermindTest < Minitest::Test

  def test_if_game_exists
    mastermind = Mastermind.new 
    # binding.pry
    assert_instance_of Mastermind, mastermind

  end

  def test_welcome_message
    mastermind = Mastermind.new 

    assert_output "Welcome to Mastermind!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n" do
       Repl.welcome
    end
  end
  
  def test_has_a_key_generator
    mastermind = Mastermind.new
    Mastermind.key_generator
    assert_equal mastermind.secret_key.count, 4 
  end
end

