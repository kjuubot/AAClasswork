let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = [];

  for (let i = 0; i < 8; i++) {
    grid.push(new Array(8));
  }

  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece('black');
  grid[3][3] = new Piece('white');
  grid[4][4] = new Piece('white');

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw new Error('Not valid pos!');
  }

  let piece = this.grid[pos[0]][pos[1]];
  return piece;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length === 0) {
    return false;
  }

  return true;
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.getPiece(pos) === undefined) {
    return undefined;
  }
  
  return this.getPiece(pos).color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos) === undefined) {
    return false;
  } else {
    return true;
  }
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return (!this.hasMove('black') && !this.hasMove('white'));
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if (pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7) {
    return false;
  }

  return true;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */

function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  pos = [pos[0] + dir[0], pos[1] + dir[1]];

  if (!board.isValidPos(pos)) {
    return null;
  } else if (!board.isOccupied(pos)) {
    return null;
  } else if (board.isMine(pos, color)) {
    return piecesToFlip;
  }

  piecesToFlip.push(pos);
  return _positionsToFlip(board, pos, color, dir, piecesToFlip);
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error("Invalid Move")
  }
  
  this.grid[pos[0]][pos[1]] = new Piece(color)

  let flipPositions = []
  let board = this

  for (let i = 0; i < Board.DIRS.length; i++) {
    let results = _positionsToFlip(board, pos, color, Board.DIRS[i], []);

    if (results) {
      flipPositions = flipPositions.concat(results);
    }
  }

  for (let i = 0; i < flipPositions.length; i++) {
    board.getPiece(flipPositions[i]).flip();
  }
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < 8; i ++) {
    let row_str = "";

    for (let j = 0; j < 8; j++) {
      pos = [i, j];

      if (this.getPiece(pos) === undefined) {
        row_str = row_str.concat(" ◯ ");
      } else {
        row_str = row_str.concat(this.getPiece(pos).toString());
      }

    }

    console.log(row_str);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }
  
  let board = this;

  for (let i = 0; i < Board.DIRS.length; i++) {
    let allPiecesToFlip =_positionsToFlip(board, pos, color, Board.DIRS[i], []);

    if (allPiecesToFlip && allPiecesToFlip.length > 0) {
      return true;
    }
  }

  return false;
}

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validPos = [];


  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      let pos = [i, j];
      if (this.validMove(pos, color)) {
        validPos.push(pos);
      }
    }
  }
  // let board = this;
  // for (let i = 0; i < board.length; i++) {
  //   for (let j = 0; j < board.length; j++) {
  //     let pos = [i, j];
  //     if (this.validMove(pos, color)) {
  //       validPos.push(pos);
  //     }
  //   }
  // }

  return validPos;
};

module.exports = Board;

let board = new Board();
board.print();
// board.validMoves('black')