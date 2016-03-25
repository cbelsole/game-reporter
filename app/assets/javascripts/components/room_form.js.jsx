var RoomForm = React.createClass({
  propTypes: {
    name: React.PropTypes.string
  },

  getInitialState() {
    return {
      tables: []
    }
  },

  addTable() {
    this.setState({ tables: this.state.tables.concat({ name: '' }) });
  },

  render() {
    return (
      <form id="new_room_form" action="/rooms" acceptCharset="UTF-8" method="post">
        <label htmlFor="room_name">Name:  </label>
        <input type="text" name="room[name]" id="room_name" />
        <h2>
          Tables
        </h2>
        <p>
          <span className="glyphicon glyphicon-plus" onClick={this.addTable}></span> add a table
        </p>
        {this.state.tables.map((table) => <RoomFormTable name={table.name} />)}
        <div>
          <input type="submit" name="commit" value="Create Room" />
        </div>
      </form>
    );
  }
});
