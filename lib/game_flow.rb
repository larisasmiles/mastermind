class GameFlow
  
  attr_reader :secret_key

  def initialize
    @secret_key = Array.new
  end

  def key_generator
    color_options = ["R", "G", "B", "Y"]
    (4).times do 
      @secret_key << color_options.sample
    end
  end
    
end
