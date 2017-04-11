require './lib/code_generator'
require './lib/game_runner.rb'
require './lib/mastermind.rb'
require 'pry'

class CodeChecker
attr_accessor :current_guess, :secret_code

  def initialize
    @current_guess = []
    @secret_code = []
  end

  def compare_codes#(code, guess)
    # secret #=> ["R", "G", "Y", "G"] - guess #=> "GBYG"
    result = code.map.with_index do |letter, i|
      if letter == guess[i]
        letter
      else #don't need this if you use compact on the result
        "X"
      end
    end
    result
  end

  def guessed_correct_colors
    color_check = secret_code.dup
    current_guess.each do |letter|
      if color_check.include?(letter)
        index = color_check.find_index(letter)
        color_check.delete_at(index)
      end
    end
    4 - color_check.count
  end

  def guessed_correct_color_positions
    4 - compare_random_to_guess.count("X")
  end
end
binding.pry
""