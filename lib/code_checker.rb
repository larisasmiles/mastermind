#require './lib/mastermind.rb'
require 'pry'
require 'pry-state'

class CodeChecker
attr_reader :current_guess, :secret_code, :correct_colors, :result

  def initialize(current_guess, secret_code)
    @current_guess = current_guess.chars
    @secret_code = secret_code
    run
  end

  def compare_codes
    @result = secret_code.select.with_index do |letter, i|
      letter == current_guess[i]
  end
    @result = @result.length
  end

  def guessed_correct_colors
    @correct_colors = 0
    secret_code.each do |letter|
      if current_guess.include?(letter)
        @correct_colors += 1
      end
    end
    correct_colors
  end
  
  def run
    compare_codes
    guessed_correct_colors
  end
  
end
