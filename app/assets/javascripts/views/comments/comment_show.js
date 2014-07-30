KicksMix.Views.CommentShow = Backbone.CompositeView.extend({
  template: JST['comments/show'],
  className: 'comment-display',

  initialize: function () {
    this.collection = this.model.comments();
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addComment);
  },

  addComment: function (comment) {
    var view = new KicksMix.Views.CommentShow({

      model: comment
    });
    this.addSubview('.comment-response', view);
  },

  getSetCommentId: function(event) {
    var commentId = $(event.currentTarget).data("id");
    $("input#comment-reply").val(commentId);
  },

  render: function () {
    var content = this.template({
      comment: this.model
    });

    this.$el.html(content);
    this.$el.data('comment-id', this.model.id);
    this.renderComments();
    this.renderReplyForm();
    return this;
  },

  renderComments: function () {
    this.model.comments().each(this.addComment.bind(this));
  },

  renderReplyForm: function() {
    var view = new KicksMix.Views.ReplyForm({
      model: this.model
    });

    this.addSubview('.reply-area:first', view);
  }
});