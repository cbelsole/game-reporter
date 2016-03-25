var RoomFormTable = React.createClass({
  propTypes: {
    name: React.PropTypes.string
  },

  onClose (event) {
    this.props.onX(this.refs.name.value)
  },

  render: function() {
    return (
      <div>
        {this.props.table.id
          ? <input type="hidden" name="room[tables][][id]" value={this.props.table.id} />
          : null}
        <label htmlFor="table_name">Name:  </label>
        <input ref="name" type="text" name="room[tables][][name]" id="table_name" defaultValue={this.props.table.name} />
        <span className={'glyphicon glyphicon-remove'} onClick={this.onClose}></span>
      </div>
    );
  }
});
