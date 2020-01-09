require_relative "piece.rb"
require_relative "rook.rb"
require_relative "knight.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "queen.rb"
require_relative "pawn.rb"
require_relative "null_piece.rb"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    fill_board
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos,val)
    row, col = pos
    @grid[row][col] = val
  end

  def fill_board
    null_piece = NullPiece.instance
    #fill with pieces :w
    @grid[0] = [Rook.new(:w,self,[0,0]),
      Knight.new(:w,self,[0,1]),
      Bishop.new(:w,self,[0,2]),
      King.new(:w,self,[0,3]),
      Queen.new(:w,self,[0,4]),
      Bishop.new(:w,self,[0,5]),
      Knight.new(:w,self,[0,6]),
      Rook.new(:w,self,[0,7])
      ]
    (0..7).each { |col| @grid[1][col] = Pawn.new(:w, self, [1,col]) }

    (2..5).each do |row|
      (0..7).each do |col|
        @grid[row][col] = null_piece
      end
    end

    (0..7).each { |col| @grid[6][col] = Pawn.new(:b, self, [1,col]) }
    # fill with pieces :b
      @grid[7] = [Rook.new(:b,self,[7,0]),
      Knight.new(:b,self,[7,1]),
      Bishop.new(:b,self,[7,2]),
      Queen.new(:b,self,[7,3]),
      King.new(:b,self,[7,4]),
      Bishop.new(:b,self,[7,5]),
      Knight.new(:b,self,[7,6]),
      Rook.new(:b,self,[7,7])
      ]
  end

  def move_piece(color, start_pos, end_pos)

    s_row, s_col = start_pos
    e_row, e_col = end_pos
    raise if (@grid[s_row][s_col].nil? || e_row < 0 || e_col < 0 || e_col > 7 || e_row > 7)
    moving_piece = @grid[s_row][s_col]
    @grid[e_row][e_col] = moving_piece
    @grid[s_row][s_col] = nil

  end



end