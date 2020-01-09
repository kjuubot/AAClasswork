require_relative "piece.rb"
require_relative "stepable.rb"

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end

  def symbol
    @symbol = "N"
  end

  def move_diff
    [[2,1], [1,2], [-1,2], [2,-1], [-2,1], [1,-2], [-2,-1], [-1,-2]]
  end

  
end