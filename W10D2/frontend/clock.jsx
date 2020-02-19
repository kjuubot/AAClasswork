import React from 'react';

class Clock extends React.Component {

    constructor() {
        super();

        this.state = {
            time: new Date()
        };

        // this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({ time: new Date() })
    }

    componentDidMount() {
        this.clockID = setInterval(
            () => this.tick(),
            1000
        );
    }

    componentWillUnmount() {
        clearInterval(this.clockID);
    }

    // function pad(number) {
    //     return (number < 10 ? '0' : '') + number;
    // }

    render() {
        return (
            <div>
                {`${this.state.time.toLocaleTimeString()}`}
            </div>
        );
    }
}

export default Clock;
