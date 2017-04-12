#require './lib/mastermind.rb'
require 'pry'
require 'pry-state'

class CodeChecker
attr_reader :current_guess, :secret_code

  def initialize(current_guess, secret_code)
    @current_guess = current_guess.chars
    @secret_code = secret_code
    run
  end

  def compare_codes(current_guess, secret_code)
    @result = secret_code.select.with_index do |letter, i|
      letter == current_guess[i]
  end
    @result = @result.length
  end

  def guessed_correct_colors(current_guess, secret_code)
    @correct_colors = 0
    @current_guess.each do |letter|
      if secret_code.include?(letter)
        @correct_colors += 1
        binding.pry
      end
    end
    @correct_colors
  end
  
  def run
    compare_codes(current_guess, secret_code)
    guessed_correct_colors(current_guess, secret_code)
  end
  
end