KicksMix.Views.CommentForm = Backbone.CompositeView.extend({
  template: JST["comments/form"],
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.comments(), "sync", this.render);
  },
  events: {
    'submit #add-comment-form' : 'addNewComment'
  },

  addNewComment: function(event) {
    event.preventDefault();
    event.stopPropagation();
    var params = $(event.currentTarget).serializeJSON();
    var comment = new KicksMix.Models.Comment(params["comment"]);

    var that = this;
    comment.save({
         model_id: this.model.id
       }, {
       success: function(e, r, o) {
        that.model.comments().add(comment);
       }
    });

    $("#new-comment-modal").modal("hide");
  },

  addComment: function(comment) {
    var view = new KicksMix.Views.CommentShow({
      model: comment
    });

    this.addSubview('#comments', view);
  },

  render: function() {
    var content = this.template({
      shoe: this.model,
      comments: this.model.comments()
    });

    this.$el.html(content);
    this.renderComments();

    return this;
  },

  renderComments: function() {
    this.model.comments().each(this.addComment.bind(this));
  }

});