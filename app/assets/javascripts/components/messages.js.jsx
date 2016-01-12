// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
//
var Messages = React.createClass({
  getDefaultProps: function() {
    return {messages: []};
  },

  render: function() {
    var row = [];
    for (var i = 0; i < this.props.messages.length; i++) {
      var msg = this.props.messages[i];
      row.push(
        <div>
          <Message message={msg} />
          <a href={"/messages/" + msg.id + "/edit"}>Edit</a>
        </div>);
    }
    return(
      <div>
        <h2>Messages</h2>
        {row}
        <a href="/messages/new">New</a>
      </div>
    );
  }
})
