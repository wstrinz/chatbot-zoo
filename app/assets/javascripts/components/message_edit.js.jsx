var MessageEdit = React.createClass({
  getInitialState: function() {
    return {message: this.props.message};
  },

  render: function() {
    return(
      <div>
        <input type="hidden" name={this.props.csrf_param} value={this.props.csrf_token}/>
        <input onChange={this._onChange} value={this.state.message.content} name="message[content]"></input>
        <input type="submit"></input>
      </div>
    );
  },

  _onChange: function(e) {
    var message = this.state.message;
    message.content = $(e.currentTarget).val();
    console.log('onChange', message.content);
    this.setState({message: message});
  }

})
