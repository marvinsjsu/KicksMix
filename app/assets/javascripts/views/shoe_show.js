KicksMix.Views.ShoeShow = Backbone.View.extend({
  template: JST["shoes/show"],
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },
  events: {
    'click a.add-comment' : 'addComment',
    'click a.add-reply' : 'replyToComment'
  },

  addComment: function(event) {
    event.preventDefault();

    $( "#comment-form" ).dialog({
      dialogClass: "no-close",
      buttons: [
        {
          text: "OK",
          click: function() {
            $( this ).dialog( "close" );
          }
        }
      ]
    });

    $("#comment-form").dialog("open");
  },

  replyToComment: function(event) {
    event.preventDefault();
    alert("replyToComment");
  },

  render: function() {
    var content = this.template({
      shoe: this.model
    });

    this.$el.html(content);
    return this;
  }
});