require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
  include Slideable
  
  def initialize(color, board, pos)
    super
  end

  def symbol
    @symbol = "B"
  end

  def move_dirs
    # [[1,1], [1,-1], [-1,1], [-1,-1]]
    diagonal_dirs
  end

end