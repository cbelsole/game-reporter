var Welcome = React.createClass({
  getInitialState() {
    return {
      mode: 'role',
      html: {
        role: this.roleHtml,
        player: this.playerHtml
      }
    }
  },

  roleHtml() {
    return (
      <div>
        <a href="/users/sign_up?role=host">
          <button className="btn btn-default btn-lg btn-block" type="button">I am looking to host a game.</button>
        </a>
        <button className="btn btn-default btn-lg btn-block" type="button" onClick={this.playerMode}>I am looking to play in a game.</button>
      </div>
    );
  },

  playerHtml() {
    return (
      <div>
        <a href="/users/sign_up?role=player">
          <button className="btn btn-default btn-lg btn-block" type="button">I want to login to save stats.</button>
        </a>
        <a href="/games/find">
          <button className="btn btn-default btn-lg btn-block" type="button">I just want to start playing. Damn the stats.</button>
        </a>
        <a onClick={this.roleMode}>Back</a>
      </div>
    );
  },


  playerMode() {
    this.setState({ mode: 'player' });
  },

  roleMode() {
    this.setState({ mode: 'role' });
  },

  render() {
    return (
      <div>
        <h1 className="text-center">Welcome to game reporter. What are you looking for?</h1>
        {this.state.html[this.state.mode]()}
      </div>
    );
  }
});
