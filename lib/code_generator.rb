class CodeGenerator

  def secret_code 
     colors = ["r", "b", "g", "y"]
     colors.map do |color|
       colors.sample
    end
  end
end

p CodeGenerator.new.secret_code