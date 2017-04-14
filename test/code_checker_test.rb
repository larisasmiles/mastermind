require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_checker.rb'
require './lib/mastermind.rb'

class CodeCheckerTest < Minitest::Test

  def test_if_it_exists
    
    c = CodeChecker.new("rrgg", ["r", "g", "g", "g"])

    assert_instance_of CodeChecker, c
  end

  def test_if_it_compares_codes
    c = CodeChecker.new("rrgg", ["r", "g", "g", "g"])
  
    assert_equal 3, c.compare_codes(c.current_guess, c.secret_code)
    refute_equal 4, c.compare_codes(c.current_guess, c.secret_code)
  end

  def test_if_it_compares_codes_2
    c = CodeChecker.new("rrgg", ["r", "g", "g", "u"])
  
    assert_equal 2, c.compare_codes(c.current_guess, c.secret_code)
  end

  def test_guessed_correct_colors
    c = CodeChecker.new("rrgg", ["r", "g", "g", "g"])

    assert_equal 4, c.guessed_correct_colors(c.current_guess, c.secret_code)
  end
  
  def test_guessed_correct_colors_2
    c = CodeChecker.new("rrgg", ["r", "g", "g", "b"])

    assert_equal 3, c.guessed_correct_colors(c.current_guess, c.secret_code)
  end
end


    
