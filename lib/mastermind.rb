require './lib/code_generator.rb'
require './lib/code_checker.rb'
require './lib/message.rb'
require "pry"
require "pry-state"

class Mastermind 
  attr_reader :secret_code, :player_guess, :guess, :total_time, :end_time, :start_time
  include Message

  def initialize
    @player_guess = []
    @guess = 0
  end

  def greet_player
    welcome
    player_choice
    options_loop
  end

  def options_loop
      @secret_code = CodeGenerator.new.secret_code
      choice = gets.chomp.downcase
      if choice == "i" || choice == "intructions"
        instructions
        choice = gets.chomp.downcase
      elsif choice == "p" || choice == "play"
        begin_game
      elsif choice == "q" || choice == "quit"
        exit
      else
        invalid_entry
        player_choice
        choice = gets.chomp.downcase
      end
  end

  def begin_game
    game_start 
    play_game
  end
  
  def play_game
    @player_guess = gets.chomp.downcase
    @start_time = Time.new
    guess_counter
  end
  
  def guess_checker(player_guess)
    if @player_guess.length != 4
      wrong_length(@player_guess)
    end
    
    if @player_guess == @secret_code.join
      @end_time = Time.new
      player_wins(secret_code, guess, total_time)
      options_loop
    elsif @player_guess == "c" || @player_guess == "cheat"
      display_secret(@secret_code)
      begin_game
    else 
      cc = CodeChecker.new(player_guess, secret_code)
      keep_trying(cc.correct_colors, cc.result, guess)
      begin_game
    end
  end

  def total_time
    @total_time = end_time - start_time
  end
    
  def guess_counter
    @guess += 1
    guess_checker(@player_guess)
  end
  

  def wrong_length(player_guess)
    if player_guess.length > 4 
      too_long
    elsif player_guess.length < 4
      too_short
    end
  end
end

m = Mastermind.new
m.greet_player






  
 
