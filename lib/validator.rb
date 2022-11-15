class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validator(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    #Strips given sudoku and leaves only the numbers
    string = @puzzle_string.delete("|").delete("-").delete("+").gsub(/\s+/, "")
    #Validation process
    if checkrow(string)
      return "Sudoku is invalid." 
    elsif checkcollumn(string)
      return "Sudoku is invalid."
    elsif checkbox(string)
      return "Sudoku is invalid."
    else
      if checkzero(string)
        return "Sudoku is valid but incomplete."
      else
        return "Sudoku is valid."
      end 
    end
  end

  def checkrow(string)
    for i in 0..8 do
      testi = " "
      #Creates string of every row and checks if they are valid by seeing if they have repeated characters
      testi = string[i*9..i*9+8]
      if testi.delete("0").chars.count{ |char| testi.count(char) > 1 } > 0
        return true
        break
      end
    end
    return false
  end

  def checkcollumn(string)
    for i in 0..8 do
      testi = " "
      #Creates string of every collumn and checks if they are valid by seeing if they have repeated characters
      for j in 0..8 do
        testi = testi + string[i+j*9]
      end
      if testi.delete("0").chars.count{ |char| testi.count(char) > 1 } > 0
        return true
        break
      end
    end
    return false
  end

  def checkbox(string)
    for i in 0..2 do
      testi = " "
      #Creates string of every box and checks if they are valid by seeing if they have repeated characters
      for j in 0..2 do
        testi = string[j+(j*2)+(i*27)..j+(j*2)+(i*27)+2] + string[j+(j*2)+i*27+9..j+(j*2)+i*27+9+2] + string[j+(j*2)+i*27+9*2..j+(j*2)+i*27+9*2+2]
        if testi.delete("0").chars.count{ |char| testi.count(char) > 1 } > 0
          return true
          break
        end
      end
    end
    return false
  end

  def checkzero(string)
    if string.include? "0"
      return true
    end
    return false
  end
end
