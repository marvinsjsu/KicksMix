KicksMix.Views.ShoeShow = Backbone.View.extend({
  template: JST["shoes/show"],
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.comments(), "sync", this.render);
  },
  events: {
    'submit #add-comment-form' : 'addComment',
    'submit #reply-comment-form' : 'replyToComment'
  },

  addComment: function(event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var comment = new KicksMix.Models.Comment(params["comment"]);

    var that = this;
    comment.save({}, {
       success: function() {
        that.model.comments().add(comment);
       }
    });


    $("#new-comment-modal").modal("hide");
  },

  replyToComment: function(event) {
    event.preventDefault();
    alert("replyToComment");
    $("#reply-comment-modal").modal("hide");
  },

  render: function() {
    var content = this.template({
      shoe: this.model
    });

    this.$el.html(content);
    return this;
  }
});