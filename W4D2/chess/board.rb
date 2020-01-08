require_relative "piece.rb"
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    fill_board
  end

  def fill_board
    (0..7).each do |row|
      (0..1).each do |col|
        @grid[row][col] = Piece.new
      end
      (2..5).each do |col|
        @grid[row][col] = nil
      end
      (6..7).each do |col|
        @grid[row][col] = Piece.new
      end
    end
  end

  def move_piece(start_pos, end_pos)

    s_row, s_col = start_pos
    e_row, e_col = end_pos
    raise if (@grid[s_row][s_col].nil? || e_row < 0 || e_col < 0 || e_col > 7 || e_row > 7)
    moving_piece = @grid[s_row][s_col]
    @grid[e_row][e_col] = moving_piece
    @grid[s_row][s_col] = nil

  end


end