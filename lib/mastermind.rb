require './lib/repl'
require './lib/game_flow'
require 'pry'

class Mastermind

  def initialize
    Repl.welcome
    user_choice
    Repl.game_start
  end
  
  def user_choice
    input = gets.chomp.downcase
    if input == "i" 
      Repl.instructions
    elsif input == "p" || input == "play"
      Repl.game_start.key_generator
    else 
      input == "q" || input == "quit"
      Repl.game_end
    end
  end
  
  def game_start
    if input == "p" || input == "play"
       key_generator
    end
  end
  Repl.welcome
  input = gets.chomp.downcase
  @game_flow.game_start
  
    
end

Mastermind.new