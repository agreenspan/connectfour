def new_game
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
  board = Board.new(width, height, win)
  turn = 0
  game = "new"
  while game != "over"
    system 'cls'
    board.print
    puts "Player #{turn%2+1}'s turn."
    move = gets.chomp.to_i
    while ( !board.validmove?(move) )
      system 'cls'
      board.print
      puts "Player #{turn%2+1}'s turn."
      puts "Please Enter a Valid Move."
      move = gets.chomp.to_i
    end
    board.place(turn%2+1, move)

    case board.check
      when "X"
        system 'cls'
        board.print
        puts "Player 1 Wins"
        game = "over"
      when "O"
        system 'cls'
        board.print
        puts "Player 2 Wins"
        game = "over"
      when "draw"
        system 'cls'
        board.print
        puts "Draw Game"
        game = "over"
      else
        turn +=1
    end
  end
end

new_game
