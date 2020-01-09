module Stepable

  # move_diffs => overwritten in piece class

  def moves(pos)
    row, col = pos
    end_pos = []

    move_diff.each do |diff|
      if row + diff[0] >= 0 && row + diff[0] < 8 && col + diff[1] >= 0 && col + diff[1] < 8
        end_pos << [row + diff[0], col + diff[1]]
      end
    end

    end_pos.select { |pos| board[pos] == nil || board[pos].color != color }
  end

end