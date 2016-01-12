var EditMessage = React.createClass({
  render: function() {
    return(
      <div>
        <form method="POST" action={"/messages/" + this.props.message.id }>
          <h2>Edit Message</h2>
          <input type="hidden" name="_method" value="PUT"/>
          <MessageEdit message={this.props.message} csrf_param={this.props.csrf_param} csrf_token={this.props.csrf_token}/>
        </form>
      </div>
    );
  }
})
