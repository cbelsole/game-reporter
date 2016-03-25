var RoomFormTable = React.createClass({
  propTypes: {
    name: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <label htmlFor="table_name">Name:  </label>
        <input type="text" name="tables[][name]" id="table_name" />
      </div>
    );
  }
});
