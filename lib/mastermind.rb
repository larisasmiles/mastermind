# require './lib/game_runner'
require './lib/message.rb'
require './lib/code_generator.rb'

class Mastermind 
  include Message

  def initialize
    @secret_code = CodeGenerator.new.secret_code
    @start_time = nil 
    @player_guess = []
  end

  def greet_player
    welcome
    player_choice
    options_loop
  end

  def options_loop
    input = gets.chomp.downcase
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
    input = gets.chomp.downcase
    guess_checker(input)
  end
  
  def guess_checker(input)
    if input == secret_code.join
      player_wins
    elsif input == "c" || input == "cheat"
      display_secret(@secret_code)
    elsif input == wrong_length
      too_long
    elsif input == wrong_length
      too_short
    # elsif input == ? what should I do here.. player_guess
      keep_trying
    else
      invalid_entry
    end
  end
end


  def wrong_length
    if input.length > 4 
      too_long
    elsif input.length < 4
      too_short
    end
  end

  # def player_guess
  #   need input to compare to secret code..is ther secret code the same as the code generator? or should
  #   I call it something different?
  #   need to have index values to be able to compare to secret code and color values.. 
  #   I want to create a method that can than use string interploation for my message. b 
  # end
  







  
 
