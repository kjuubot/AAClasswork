require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece
  include Stepable
  
  def initialize(color, board, pos)
    super
  end

  def symbol
    @symbol = "K"
  end

  def move_diff
    [[1,1], [1,-1], [-1,1], [-1,-1], [0,1], [1,0], [0,-1], [-1,0]]
  end
  
end