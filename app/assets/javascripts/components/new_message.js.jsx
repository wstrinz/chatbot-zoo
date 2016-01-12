var NewMessage = React.createClass({
  render: function() {
    return(
      <div>
        <form method="POST" action="/messages">
          <h2>New Message</h2>
          <MessageEdit message={this.props.message} csrf_param={this.props.csrf_param} csrf_token={this.props.csrf_token}/>
        </form>
      </div>
    );
  }
})
