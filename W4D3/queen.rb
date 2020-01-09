require_relative "piece.rb"
require_relative "slideable.rb"

class Queen < Piece
  include Slideable
  
  def initialize(color, board, pos)
    super
  end

  def symbol
    @symbol = "Q"
  end

  def move_dirs
    # [[1,1], [1,-1], [-1,1], [-1,-1], [0,1], [1,0], [0,-1], [-1,0]]
    horizontal_dirs + diagonal_dirs
  end
  
end