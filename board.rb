class @board
  def initialize(width, height, win)
    @width = width
    @height = height
    @win = win
    @board = Array.new(height) { Array.new(width) }
  end

  def width
    @width
  end
  def height
    @height
  end
  def win
    @win
  end

  def get_cell(row,col)
    @board[row][col]
  end

  def set_cell(row,col,token)
    @board[row][col] = token
  end

  def print
    @board.each do | row |
      row.each do | col |
        print "[" + ( col.nil? ? " " : col ) + "]"
      end
      puts ""
    end
  end

  def validmove?(move)
    return false if ( move < 1 || move > @board.width )
    return false if ( !board.cell(0,move-1).nil? )
    return true
  end

  def place(player, move)
    @board.reverse.each do | row |
      if row[move-1].nil?
        if player == 1
          row[move-1] = "X" 
        else
          row[move-1] = "O"
        end
        break
      end
    end
  end


  def check
    #row check
    @board.each do |row|
      count = 0
      token = ""    
      row.each do |col|
        if col.nil?
          count = 0
          token = ""
        elsif token == ""
          token = col
          count = 1    
        elsif col == token
          count +=1  
        else
          token = col
          count = 1     
        end
        return token if count >= win
      end
    end

    #col check
    @board[0].length.times do |col|
      count = 0
      token = ""    
      @board.length.times do |row|
        cell = @board[row][col]
        if cell.nil?
          count = 0
          token = ""
        elsif token == ""
          token = cell
          count = 1    
        elsif cell == token
          count +=1  
        else
          token = cell
          count = 1     
        end
        return token if count >= win
      end
    end

    #backslash diag check
    #width diagonals
    (@board[0].length).times do |col|
      count = 0
      token = ""    
      @board.length.times do |row|
        break if col+row > @board[0].length-1
        cell = @board[row][col+row]
        if cell.nil?
          count = 0
          token = ""
        elsif token == ""
          token = cell
          count = 1    
        elsif cell == token
          count +=1  
        else
          token = cell
          count = 1     
        end
        return token if count >= win
      end
    end
    #height diagonals
    for row in (1..@board.length-1) do
      count = 0
      token = ""    
      @board[0].length.times do |col|
        break if col+row > @board.length-1 
        cell = @board[row+col][col]
        if cell.nil?
          count = 0
          token = ""
        elsif token == ""
          token = cell
          count = 1    
        elsif cell == token
          count +=1  
        else
          token = cell
          count = 1     
        end
        return token if count >= win
      end
    end

    #forwardslash diag check
    #width diagonals
    (@board[0].length).times do |col|
      count = 0
      token = ""    
      @board.length.times do |row|
        break if col-row < 0 
        cell = @board[row][col-row]
        if cell.nil?
          count = 0
          token = ""
        elsif token == ""
          token = cell
          count = 1    
        elsif cell == token
          count +=1  
        else
          token = cell
          count = 1     
        end
      end
    end
    #height diagonals
    for row in (1..@board.length-1) do
      count = 0
      token = ""    
      @board[0].length.times do |col|
        break if row+col > @board.length-1 
        cell = @board[row+col][@board[0].length-col]
        if cell.nil?
          count = 0
          token = ""
        elsif token == ""
          token = cell
          count = 1    
        elsif cell == token
          count +=1  
        else
          token = cell
          count = 1     
        end
        return token if count >= win
      end
    end

    #check draw
    draw = true
    @board[0].each do |cell|
      draw = false if cell.nil?
    end
    return "draw" if draw
  end


end