require './lib/game_start'
require './message'
require 'pry'

class Mastermind 


  def user_choice
    input = gets.chomp.downcase
    until input == "q" || input == "quit"
      if input == "i" 
      message.instructions
      elsif input == "p" || input == "play"
      message.game_start
      else
        message.game_end
      end
    end
 end
 
