# require './lib/game_runner'
require './lib/message.rb'
require './lib/code_generator.rb'
require './lib/code_checker.rb'
require "pry"
require "pry-state"

class Mastermind 
    attr_reader :secret_code, :player_guess
  include Message

  def initialize
    @start_time = nil 
    @player_guess = []
  end

  def greet_player
    welcome
    player_choice
    options_loop
  end

  def options_loop
      @secret_code = CodeGenerator.new.secret_code
      @player_guess = gets.chomp.downcase
      if @player_guess == "i" || @player_guess == "intructions"
        instructions
        @player_guess = gets.chomp.downcase
      elsif @player_guess == "p" || @player_guess == "play"
        play_game
      elsif @player_guess == "q" || @player_guess == "quit"
        exit
      else
        invalid_entry
        player_choice
        @player_guess = gets.chomp.downcase
      end
  end

  def play_game
    game_start
    @player_guess = gets.chomp.downcase
    guess_checker(@player_guess)
  end
  
  def guess_checker(player_guess)
    if @player_guess.length != 4
      wrong_length
    end
    
    if @player_guess == secret_code.join
      player_wins
      options_loop
    elsif @player_guess == "c" || @player_guess == "cheat"
      display_secret(@secret_code)
    else 
      CodeChecker.new(player_guess, secret_code)
    end
  end
end


  def wrong_length
    if @player_guess.length > 4 
      too_long
    elsif @player_guess.length < 4
      too_short
    end
  end

  # def player_guess
  #   need @player_guess to compare to secret code..is ther secret code the same as the code generator? or should
  #   I call it something different?
  #   need to have index values to be able to compare to secret code and color values.. 
  #   I want to create a method that can than use string interploation for my message. b 
  # end
  







  
 
