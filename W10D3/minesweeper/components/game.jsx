import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

export default class Game extends React.Component {
    constructor() {
        super();
        this.state = {
            board: new Minesweeper.Board(8,3)
            // board: <Board rowsNcols={8} bombs = {3} /> //Board Component

        };

        this.updateGame = this.updateGame.bind(this);
    }

    updateGame() {

    }

    render() {
        return (
            <div>
                Hello
                <Board //board component
                    board = {this.state.board}  //prop with key of board and value boardinstance
                    updateGame = {this.updateGame}
                />
            </div>
        )
    }
}