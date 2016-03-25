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
        <label htmlFor="table_name">Name:  </label>
        <input ref="name" type="text" name="room[tables][][name]" id="table_name" defaultValue={this.props.name} />
        <span className={'glyphicon glyphicon-remove'} onClick={this.onClose}></span>
      </div>
    );
  }
});
