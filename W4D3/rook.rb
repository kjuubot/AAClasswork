require_relative "piece.rb"
require_relative "slideable.rb"

class Rook < Piece
  include Slideable
  
  def initialize(color, board, pos)
    super
  end

  def symbol
    @symbol = "R"
  end

  def inspect
    puts "#{symbol}"
  end
  
  def move_dirs
    # [[0,1], [1,0], [0,-1], [-1,0]]
    horizontal_dirs
  end
  
end