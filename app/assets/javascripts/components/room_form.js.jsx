var RoomForm = React.createClass({
  propTypes: {
    name: React.PropTypes.string
  },

  getInitialState() {
    return {
      room: this.props.initialRoom || {name: 'Room name'},
      tables: this.props.initialTables || [],
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

  submitForm(event) {
    event.preventDefault();
    if ( _.isEmpty(this.state.room.name.strip)) {
      return false
    } else if (_.isEmpty(this.state.tables)) {
      return false
    } else if (_.find(this.state.tables, (table) => _.isEmpty(table.name.strip))) {
      return false
    }
    event.submit();
    
  },

  render() {
    let path = this.state.room.id ? `/rooms/${this.state.room.id}` : '/rooms'

    return (
      <form id="new_room_form" action={path} acceptCharset="UTF-8" method="post" onSubmit={this.submitForm}>
        {this.state.room.id ? <input type="hidden" name="_method" value="PUT"/ > : null}
        <input name="authenticity_token" type="hidden" value={this.state.token} />
        <label htmlFor="room_name">Name:  </label>
        <input type="text" name="room[name]" id="room_name" defaultValue={this.state.room.name} />
        <h2>Tables</h2>
        <p>
          <span className="glyphicon glyphicon-plus" onClick={this.addTable}></span> add a table
        </p>
        {this.state.tables.map((table, i) => <RoomFormTable key={table.id + table.name} table={table} onX={this.removeTable} />)}
        <div>
          <input type="submit" name="commit" value={this.state.room.id ? 'Edit Room' : 'Create Room'} />
        </div>
      </form>
    );
  }
});
