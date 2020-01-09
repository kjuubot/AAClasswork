require_relative "piece.rb"

class Pawn < Piece

  def initialize(color,board,pos)
    super
  end

  def symbol
    @symbol = "P"
  end

  def move_dirs 
    [forward_dir, 0]
  end

  private

  def at_start_row?
    return true if color == :w && pos[0] == 1
    return true if color == :b && pos[0] == 6
    false
  end

  def forward_dir
    return 1 if color == :w
    return -1 if color == :b
  end

  def forward_steps

  end

  def side_attacks

  end
end