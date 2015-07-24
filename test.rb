#test.rb
require './board'


describe Board do 
  it "is invalid move" do
    board = Board.new(7,6,4)
    board.set_board( [
            ["X","O","O","X","X","X","O"],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    for move in (1..board.width) do 
      expect(board.validmove?(move)).to eq(false)
    end
  end

  it "is blank" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq(nil)
  end
  it "is draw" do
    board = Board.new(7,6,4)
    board.set_board( [
            ["X","O","O","X","X","X","O"],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("draw")
  end
  it "p1 win" do
    board = Board.new(7,6,4)

    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "p2 win" do
    board = Board.new(7,6,4)

    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            ["O",nil,nil,nil,nil,nil,nil],
            ["O",nil,nil,nil,nil,nil,nil],
            ["O",nil,nil,nil,nil,nil,nil],
            ["O",nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("O")
  end
  it "v win top-left" do
    board = Board.new(7,6,4)

    board.set_board( [
            ["X",nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "v win middle-left" do
    board = Board.new(7,6,4)

    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "v win top-middle" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,"X",nil,nil,nil,nil,nil],
            [nil,"X",nil,nil,nil,nil,nil],
            [nil,"X",nil,nil,nil,nil,nil],
            [nil,"X",nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "v win top-right" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "v win middle-right" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "v win bottom-right" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,nil,"X"]
          ])
    expect(board.check).to eq("X")
  end
  it "v win bottom-middle" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,nil,"X",nil]
          ])
    expect(board.check).to eq("X")
  end
  it "v win middle-middle" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "h win top-left" do
    board = Board.new(7,6,4)
    board.set_board( [
            ["X","X","X","X",nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "h win middle-left" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            ["X","X","X","X",nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "h win bottom-left" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            ["X","X","X","X",nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "h win top-middle" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,"X","X","X","X",nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "h win middle-middle" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,"X","X","X","X",nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "h win bottom-middle" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,"X","X","X","X",nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "h win top-right" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,"X","X","X","X"],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "h win middle-right" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,"X","X","X","X"],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "h win bottom-right" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,"X","X","X","X"]
          ])
    expect(board.check).to eq("X")
  end
  it "/ win top" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,"X",nil,nil],
            [nil,nil,nil,"X",nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "/ win side" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,"X",nil,nil],
            [nil,nil,nil,"X",nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "/ win bottom" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,"X"],
            [nil,nil,nil,nil,nil,"X",nil],
            [nil,nil,nil,nil,"X",nil,nil],
            [nil,nil,nil,"X",nil,nil,nil],
          ])
    expect(board.check).to eq("X")
  end
  it "\ win top" do
    board = Board.new(7,6,4)
    board.set_board( [
            ["X",nil,nil,nil,nil,nil,nil],
            [nil,"X",nil,nil,nil,nil,nil],
            [nil,nil,"X",nil,nil,nil,nil],
            [nil,nil,nil,"X",nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "\ win side" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            [nil,"X",nil,nil,nil,nil,nil],
            [nil,nil,"X",nil,nil,nil,nil],
            [nil,nil,nil,"X",nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end
  it "\ win bottom" do
    board = Board.new(7,6,4)
    board.set_board( [
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            ["X",nil,nil,nil,nil,nil,nil],
            [nil,"X",nil,nil,nil,nil,nil],
            [nil,nil,"X",nil,nil,nil,nil],
            [nil,nil,nil,"X",nil,nil,nil]
          ])
    expect(board.check).to eq("X")
  end

end
