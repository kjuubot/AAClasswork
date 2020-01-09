# require_relative "board.rb"

class Piece
  attr_reader :color, :pos, :symbol

  def initialize(color, board, pos)
    @pos = pos
    @color = color
    @board = board
  end

  # def inspect # return emoji for piece so board looks nice
  #   puts "#{symbol}"
  # end
  
  def empty? # Check if null piece

  end

  def valid_moves

  end

  def pos=(val)

  end

  def moves(piece)

  end


end

