var Welcome = React.createClass({
  getInitialState() {
    return {
      headingText: 'Welcome to game reporter. What are you looking for?',
      html: {
        player: this.playerHtml,
        playerForm: this.playerFormHtml,
        role: this.roleHtml,
      },
      mode: 'role',
      token: '',
      username: ''
    }
  },

  componentDidMount: function(e) {
    this.setState({token: $('meta[name=csrf-token]').attr('content')});
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
        <button className="btn btn-default btn-lg btn-block" type="button" onClick={this.playerFormMode}>I just want to start playing. Damn the stats.</button>
        <button className="btn btn-default btn-lg btn-block" type="button" onClick={this.roleMode}>Back</button>
      </div>
    );
  },

  updateUsername(event) {
    this.setState({ username: event.target.value })
  },

  playerFormHtml() {
    return (
      <div className="text-center">
        <form action="/users" method="post">
          <input name="authenticity_token" type="hidden" value={this.state.token} />
          <label htmlFor="username">Username:</label>
          <input name="guest" type="text" value={this.state.username} onChange={this.updateUsername}/>
          <br/>
          <button type="submit"className="btn btn-default btn-lg btn-block" type="submit">I want to start playing.</button>
        </form>
        <button className="btn btn-default btn-lg btn-block" type="button" onClick={this.playerMode}>Back</button>
      </div>
    );
  },


  playerMode() {
    this.setState({ headingText: 'Welcome to game reporter. What are you looking for?', mode: 'player' });
  },

  playerFormMode() {
    this.setState({ headingText: 'What do you want us to call you?', mode: 'playerForm' });
  },

  roleMode() {
    this.setState({ headingText: 'Welcome to game reporter. What are you looking for?', mode: 'role' });
  },

  render() {
    return (
      <div>
        <h1 className="text-center">{this.state.headingText}</h1>
        {this.state.html[this.state.mode]()}
      </div>
    );
  }
});
