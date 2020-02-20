import React from 'react';
import Minesweeper from '../minesweeper';
import Tile from './tile';

export default class Board extends React.Component {
    constructor(props){
        super(props);
        this.state={
            rowsNcols: this.props.board.gridSize,
            bombs: this.props.board.numBombs
        }
    }

    renderRows(row){
        return row.map((tile,idx)=>{
            return (<Tile tile={tile} updateGame={this.props.updateGame} key={idx} />)
        })
    }
    render(){
        
        const tiles = this.props.board.grid.map((row, idx1) => {
            return <div key={idx1}>{this.renderRows(row)}</div>
        }
        debugger;
        return(
            <div>
              {tiles}  
            </div>
        )
    }
}