def new_game
  game = "new"
  system 'cls'
  puts "Please Enter Board Width [7-15]"
  width = gets.chomp.to_i
  while ( width < 7 || width > 15 )
    system 'cls'
    puts "Please Enter a valid Board Width [7-15]"
    width = gets.chomp.to_i
  end

  system 'cls'
  puts "Enter Board Height [6-12]"
  height = gets.chomp.to_i
  while ( height < 6 || height > 12 )
    system 'cls'
    puts "Please Enter a Valid Board Height [7-15]"
    height = gets.chomp.to_i
  end

  system 'cls'
  puts "Enter Win Length [4-7]"
  win = gets.chomp.to_i
  while ( win < 4 || win > 12 )
    system 'cls'
    puts "Please Enter a Valid Win Length [7-15]"
    win = gets.chomp.to_i
  end

  board = Array.new(height) { Array.new(width) }
  turn = 0

  while game != "over"
    system 'cls'
    printboard(board)
    puts "Player #{turn%2+1}'s turn."
    move = gets.chomp.to_i
    while ( !validmove?(move, board) )
      system 'cls'
      printboard(board)
      puts "Player #{turn%2+1}'s turn."
      puts "Please Enter a Valid Move."
      move = gets.chomp.to_i
    end
    board.reverse.each do | row |
      if row[move-1].nil?
        if turn%2+1 == 1
          row[move-1] = "X" 
        else
          row[move-1] = "O"
        end
        break
      end
    end
    check = checkboard(board, win)
    if check == "X"
      system 'cls'
      printboard(board)
      puts "Player 1 Wins"
      game = "over"
    elsif check == "O"
      system 'cls'
      printboard(board)
      puts "Player 2 Wins"
      game = "over"
    elsif check == "draw"
      system 'cls'
      printboard(board)
      puts "Draw Game"
      game = "over"
    end
    turn +=1
  end

end

def printboard(board)
  board.each do | row |
    row.each do | col |
      print "[" + ( col.nil? ? " " : col ) + "]"
    end
    puts ""
  end
end

def validmove?(move, board)
  return false if ( move < 1 || move > board[0].length )
  return false if ( !board[0][move-1].nil? )
  return true
end

def checkboard(board, win)
  #row check
  board.each do |row|
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
  board[0].length.times do |col|
    count = 0
    token = ""    
    board.length.times do |row|
      cell = board[row][col]
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
  (board[0].length).times do |col|
    count = 0
    token = ""    
    board.length.times do |row|
      break if col+row > board[0].length-1
      cell = board[row][col+row]
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
  for row in (1..board.length-1) do
    count = 0
    token = ""    
    board[0].length.times do |col|
      break if col+row > board.length-1 
      cell = board[row+col][col]
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
  (board[0].length).times do |col|
    count = 0
    token = ""    
    board.length.times do |row|
      break if col-row < 0 
      cell = board[row][col-row]
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
  for row in (1..board.length-1) do
    count = 0
    token = ""    
    board[0].length.times do |col|
      break if row-col < 0 
      cell = board[row-col][col]
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
  board[0].each do |cell|
    draw = false if cell.nil?
  end
  return "draw" if draw
end

new_game
