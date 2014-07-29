KicksMix.Views.ShoeShow = Backbone.CompositeView.extend({
  className: 'clearfix',

  template: JST["shoes/show"],

  initialize: function() {
    this.collection = this.model.comments();
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addComment);

    var commentCollection = this.model.comments();
    var commentsTree = {};

    commentCollection.each(function(comment) {
      commentsTree[comment.parent_id] = commentsTree[comment.parent_id] || [];
      commentsTree[comment.parent_id].push(comment);
    });


    this.topLevelComments = commentsTree[undefined];
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
      //comments: this.topLevelComments,
      template: this.template,
    });

    this.$el.html(content);
    this.renderComments();
    this.renderCommentForm();
    return this;
  },

  renderComments: function() {
    this.model.comments().each(this.addComment.bind(this));
  },

  renderCommentForm: function() {
    var view = new KicksMix.Views.CommentForm({
      model: this.model,
      collection: this.collection
    });

    this.addSubview('#comment-form', view);
  }
});

















