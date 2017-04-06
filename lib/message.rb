class Message

  def self.welcome
    puts "Welcome to Mastermind!"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
  
  def self.game_start
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  end

  def self.instructions
     puts "Hi I don't know how to play this"

  end

  def self.game_end
    puts "Thank you for playing!"
  end
  


end



