module Slideable

  HORIZONTAL_DIRS = [[0,1], [1,0], [0,-1], [-1,0]]
  DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]

  # #grow_unblocked_moves is helper function for #hor_dirs and #diag_dirs
  # #hor_dirs and #diag_dirs are helper functions for #moves

  def moves # array of all possible moves
    all_moves = []
    move_dirs.each { |dir| all_moves += grow_unblocked_moves_in_dir(dir[0], dir[1]) }

    all_moves
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private

  def grow_unblocked_moves_in_dir(dx,dy) # returns arr of all positions in one dir
    moves_in_dir = []
    row, col = pos

    while board[[row+dx,col+dy]].is_a?(NullPiece) || board[[row+dx,col+dy]].color != color
      # while space is empty or space is not your piece
      moves_in_dir << [row+dx, col+dy]
      # move space
      break if !board[[row+dx,col+dy]].is_a?(NullPiece) && board[[row+dx,col+dy]].color != color
      # stop if space is not empty and space is not your piece
      row += dx
      col += dy
    end

    moves_in_dir
  end

end