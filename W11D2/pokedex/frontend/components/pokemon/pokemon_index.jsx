import React from 'react';


export default class Pokemon extends React.Component{
  componentDidMount() {
    // debugger;
    this.props.requestAllPokemon();
  }

  render () {
    // const pokeIndex = this.props.pokemon.values();
  const pokeIndex = this.props.pokemon.map(poke => <li>{poke.name}</li>)
    
    return (
      <div>
        <ul>
          {pokeIndex}
        </ul>
      </div>
    )
  }
}