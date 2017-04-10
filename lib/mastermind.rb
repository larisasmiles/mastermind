# require './lib/game_runner'
require './lib/message.rb'
require './lib/code_generator.rb'

class Mastermind 
  attr_reader :input
    
     include Message


  def initialize
  
    @secret_code = CodeGenerator.new.secret_code
    @start_time = nil 
    greet_player
  end

  def greet_player
    welcome
    player_choice
    options_loop
  end

  def options_loop
    @input = gets.chomp.downcase
    until input == "q" || input == "quit"
      if input == "i" || input == "intructions"
        instructions
        input = gets.chomp.downcase
      elsif 
        input == "p" || input == "play"
        play_game
      else
        invalid_entry
        player_choice
        input = gets.chomp.downcase
      end
    end
  end
  
  def play_game
    game_start
    input = gets.chomp.downcase
    guess_checker(input)
  end

  def guess_checker(input)
    input = gets.chomp.downcase
    if input == secret_code
      player_wins
    elsif input == "c" || input == "cheat"
      secret_code
    elsif input == wrong_length
      too_long
    elsif input == wrong_length
      too_short
    else
      invalid_entry
    end
  end

  def wrong_length
    if input.length > 4 
      too_long
    elsif input.length < 4
      too_short
    end
  end
end



  
 
