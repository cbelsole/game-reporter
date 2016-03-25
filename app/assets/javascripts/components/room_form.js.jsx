var RoomForm = React.createClass({
  propTypes: {
    name: React.PropTypes.string
  },

  getInitialState() {
    return {
      tables: [],
      token: ''
    }
  },

  componentDidMount: function(e) {
    this.setState({token: $('meta[name=csrf-token]').attr('content')});
  },

  addTable() {
    this.setState({ tables: this.state.tables.concat({ name: `Table ${this.state.tables.length + 1}` }) });
  },

  removeTable(tableName) {
    this.setState({tables: this.state.tables.filter((table) => table.name !== tableName)})
  },

  render() {
    return (
      <form id="new_room_form" action="/rooms" acceptCharset="UTF-8" method="post">
        <input name="authenticity_token" type="hidden" value={this.state.token} />
        <label htmlFor="room_name">Name:  </label>
        <input type="text" name="room[name]" id="room_name" />
        <h2>Tables</h2>
        <p>
          <span className="glyphicon glyphicon-plus" onClick={this.addTable}></span> add a table
        </p>
        {this.state.tables.map((table, i) => <RoomFormTable key={table.name} name={table.name} onX={this.removeTable} />)}
        <div>
          <input type="submit" name="commit" value="Create Room" />
        </div>
      </form>
    );
  }
});
