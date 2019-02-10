App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // debugger;
    // Called when there's incoming data on the websocket for this channel
    // $("#notifications").prepend(data.html);
    // console.log(data)
    // from rails console
    // ActionCable.server.broadcast "notifications:1", {:html=>"<div>Hello!</div>"}
    $("#notifications").prepend(data.html);
  }
});

// second user followed the first user
// Notification.create(recipient: User.first, user: User.last, action: "followed", notifiable: User.first)

// render out a partial for this...
